require 'digest/md5'
require 'faye/websocket'
require 'rack'
require 'docker'

Rack::File.new(File.dirname(__FILE__))

App = lambda do |env|
  if Faye::WebSocket.websocket?(env)
    ws = Faye::WebSocket.new(env)

    ws.on :message do |_|
      # Services
      begin
        all_services_details = Docker.connection.get('/services')
        all_services_details = JSON.parse(all_services_details)

        all_services = Docker.connection.get('/tasks')
        all_services = JSON.parse(all_services)
        all_services = all_services.map do |service|
          details = all_services_details.select do |service_detail|
            service_detail['ID'] == service['ServiceID']
          end
          color = '#' + Digest::MD5.hexdigest(service['ServiceID'])[0..5]
          {
            'id'        => service['ID'],
            'nodeId'    => service['NodeID'],
            'serviceId' => service['ServiceID'],
            'name'      => details[0]['Spec']['Name'],
            'status'    => service['Status']['State'],
            'color'     => color
          }
        end
        all_services = all_services.select do |service|
          !['shutdown'].include? service['status']
        end
      rescue
        all_services = []
      end

      # Nodes
      begin
        all_nodes = Docker.connection.get('/nodes')
        all_nodes = JSON.parse(all_nodes)
        all_nodes = all_nodes.map do |node|
          services = all_services.select { |hash| hash['nodeId'] == node['ID'] }
          {
            'id'       => node['ID'],
            'hostname' => node['Description']['Hostname'],
            'status'   => node['Status']['State'].downcase,
            'services' => services
          }
        end
        all_nodes = all_nodes.select do |node|
          ['ready'].include? node['status']
        end
      rescue
        all_nodes = {}
      end

      ws.send({ 'nodes' => all_nodes }.to_json)
    end

    ws.on :close do |event|
      p [:close, event.code, event.reason]
      ws = nil
    end

    ws.rack_response
  else
    [200, { 'Content-Type' => 'text/html' }, [File.read('public/index.html')]]
  end
end
