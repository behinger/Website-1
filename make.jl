# needs JSServe#sd/asset-plugins
using Revise, Website
using Website.JSServe

routes, task, server = interactive_server(Website.asset_paths()) do
    return Routes(
        "/" => App(index, title="Makie"),
        "/team" => App(team, title="Team"),
        "/contact" => App(contact, title="Contact"),
        "/support" => App(support, title="Support")
    )
end

##
dir = joinpath(@__DIR__, "docs")
# only delete the jsserve generated files
rm(joinpath(dir, "jsserve"); recursive=true, force=true)
JSServe.export_static(dir, routes)
