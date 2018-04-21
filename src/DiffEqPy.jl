module DiffEqPy

using Reexport
@reexport using DifferentialEquations
using PyCall
pysolve = PyCall.pyfunctionret(solve,Any,PyCall.PyAny)

export pysolve

@pyimport inspect
function DiffEqBase.numargs(f::PyCall.PyObject)
    haskey(f,:py_func) ? _f = f[:py_func] : _f = f
    length(first(inspect.getfullargspec(_f)))
end

end # module
