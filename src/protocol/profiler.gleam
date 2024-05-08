//// > ⚙️  This module was generated from the Chrome DevTools Protocol version **1.3**
//// ## Profiler Domain  
////
//// This protocol domain has no description.  
////
//// [📖   View this domain on the DevTools Protocol API Docs](https://chromedevtools.github.io/devtools-protocol/1-3/Profiler/)

// ---------------------------------------------------------------------------
// |  !!!!!!   This is an autogenerated file - Do not edit manually  !!!!!!  |
// | Run ` gleam run -m scripts/generate_protocol_bindings.sh` to regenerate.|  
// ---------------------------------------------------------------------------

import chrome
import protocol/debugger
import protocol/runtime

/// Profile node. Holds callsite information, execution statistics and child nodes.
pub type ProfileNode {
  ProfileNode(
    id: Int,
    call_frame: runtime.CallFrame,
    hit_count: Int,
    children: List(Int),
    deopt_reason: String,
    position_ticks: List(PositionTickInfo),
  )
}

/// Profile.
pub type Profile {
  Profile(
    nodes: List(ProfileNode),
    start_time: Float,
    end_time: Float,
    samples: List(Int),
    time_deltas: List(Int),
  )
}

/// Specifies a number of samples attributed to a certain source position.
pub type PositionTickInfo {
  PositionTickInfo(line: Int, ticks: Int)
}

/// Coverage data for a source range.
pub type CoverageRange {
  CoverageRange(start_offset: Int, end_offset: Int, count: Int)
}

/// Coverage data for a JavaScript function.
pub type FunctionCoverage {
  FunctionCoverage(
    function_name: String,
    ranges: List(CoverageRange),
    is_block_coverage: Bool,
  )
}

/// Coverage data for a JavaScript script.
pub type ScriptCoverage {
  ScriptCoverage(
    script_id: runtime.ScriptId,
    url: String,
    functions: List(FunctionCoverage),
  )
}
