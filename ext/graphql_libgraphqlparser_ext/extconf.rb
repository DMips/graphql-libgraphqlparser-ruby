require 'mkmf'

prefixes = %w(ENV["LD_LIBRARY_PATH"] /usr /usr/local)
if prefix = prefixes.find{ |prefix| Dir["#{prefix}/lib/libgraphqlparser*"].first }
  dir_config('graphql', "#{prefix}/include/graphqlparser", "#{prefix}/lib")
else
  dir_config('graphql')
end
abort 'missing libgraphqlparser' unless have_library('graphqlparser')
abort 'missing libgraphqlparser headers' unless have_header('c/GraphQLParser.h')

create_makefile "graphql_libgraphqlparser_ext"
