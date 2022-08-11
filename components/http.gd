extends Component\nclass_name HttpComponent\n\nfunc _init():\n\tsuper("httpcomponent")\n\nfunc component_ready():\n\tvar http_request = HTTPRequest.new()\n\tcontrol.add_child(http_request)\n
