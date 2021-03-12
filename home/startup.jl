try
  using Revise
catch e
  @warn "Revise unavailable" exception=(e, catch_backtrace())
end
