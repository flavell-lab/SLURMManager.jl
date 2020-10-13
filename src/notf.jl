dt_now_str(format_str="yyyy-mm-dd HH:MM:SS") = Dates.format(now(), format_str)
str_with_dt(str) = "$(dt_now_str()): $str"
println_dt(str) = println(str_with_dt(str))

# pushover
if haskey(ENV, "PUSHOVER_TOKEN") && haskey(ENV, "PUSHOVER_USER")
    using Pushover
    USE_PUSHOVER = true
    pushover_client = (ENV["PUSHOVER_USER"], ENV["PUSHOVER_TOKEN"])

    function send_pushover_notf(client::PushoverClient, message::String)
        send(client, message, priority=1)
    end
end
