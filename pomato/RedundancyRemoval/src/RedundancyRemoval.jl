module RedundancyRemoval

using CSV, DataFrames, Dates, Logging, LoggingExtras
using LinearAlgebra
using JuMP, Gurobi
using Base.Threads, ThreadTools

include("redundancy_removal_functions.jl")

export run_redundancy_removal_parallel, run_redundancy_removal

function __init__()
	global wdir = pwd()
	# global_logger(ConsoleLogger(stdout, Logging.Info))
	TeeLogger(MinLevelLogger(FileLogger(wdir*"/logs/RedundancyRemoval.log", append=true), Logging.Info),
	          ConsoleLogger(stdout, Logging.Info)) |> global_logger
	@info("No arguments passed or not running in repl, initializing in pwd()")
	@info("Initialized")
end
end # module
