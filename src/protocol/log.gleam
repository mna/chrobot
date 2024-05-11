//// > ⚙️  This module was generated from the Chrome DevTools Protocol version **1.3**
//// ## Log Domain  
////
//// Provides access to log entries.  
////
//// [📖   View this domain on the DevTools Protocol API Docs](https://chromedevtools.github.io/devtools-protocol/1-3/Log/)

// ---------------------------------------------------------------------------
// |  !!!!!!   This is an autogenerated file - Do not edit manually  !!!!!!  |
// | Run ` gleam run -m scripts/generate_protocol_bindings.sh` to regenerate.|  
// ---------------------------------------------------------------------------

import chrome
import gleam/dynamic
import gleam/json
import gleam/option
import gleam/result
import protocol/network
import protocol/runtime

/// Log entry.
pub type LogEntry {
  LogEntry(
    source: LogEntrySource,
    level: LogEntryLevel,
    text: String,
    category: option.Option(LogEntryCategory),
    timestamp: runtime.Timestamp,
    url: option.Option(String),
    line_number: option.Option(Int),
    stack_trace: option.Option(runtime.StackTrace),
    network_request_id: option.Option(network.RequestId),
    worker_id: option.Option(String),
    args: option.Option(List(runtime.RemoteObject)),
  )
}

/// This type is not part of the protocol spec, it has been generated dynamically 
/// to represent the possible values of the enum property `source` of `LogEntry`
pub type LogEntrySource {
  LogEntrySourceXml
  LogEntrySourceJavascript
  LogEntrySourceNetwork
  LogEntrySourceStorage
  LogEntrySourceAppcache
  LogEntrySourceRendering
  LogEntrySourceSecurity
  LogEntrySourceDeprecation
  LogEntrySourceWorker
  LogEntrySourceViolation
  LogEntrySourceIntervention
  LogEntrySourceRecommendation
  LogEntrySourceOther
}

@internal
pub fn encode__log_entry_source(value__: LogEntrySource) {
  case value__ {
    LogEntrySourceXml -> "xml"
    LogEntrySourceJavascript -> "javascript"
    LogEntrySourceNetwork -> "network"
    LogEntrySourceStorage -> "storage"
    LogEntrySourceAppcache -> "appcache"
    LogEntrySourceRendering -> "rendering"
    LogEntrySourceSecurity -> "security"
    LogEntrySourceDeprecation -> "deprecation"
    LogEntrySourceWorker -> "worker"
    LogEntrySourceViolation -> "violation"
    LogEntrySourceIntervention -> "intervention"
    LogEntrySourceRecommendation -> "recommendation"
    LogEntrySourceOther -> "other"
  }
  |> json.string()
}

@internal
pub fn decode__log_entry_source(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("xml") -> Ok(LogEntrySourceXml)
    Ok("javascript") -> Ok(LogEntrySourceJavascript)
    Ok("network") -> Ok(LogEntrySourceNetwork)
    Ok("storage") -> Ok(LogEntrySourceStorage)
    Ok("appcache") -> Ok(LogEntrySourceAppcache)
    Ok("rendering") -> Ok(LogEntrySourceRendering)
    Ok("security") -> Ok(LogEntrySourceSecurity)
    Ok("deprecation") -> Ok(LogEntrySourceDeprecation)
    Ok("worker") -> Ok(LogEntrySourceWorker)
    Ok("violation") -> Ok(LogEntrySourceViolation)
    Ok("intervention") -> Ok(LogEntrySourceIntervention)
    Ok("recommendation") -> Ok(LogEntrySourceRecommendation)
    Ok("other") -> Ok(LogEntrySourceOther)
    _ -> Error(chrome.ProtocolError)
  }
}

/// This type is not part of the protocol spec, it has been generated dynamically 
/// to represent the possible values of the enum property `level` of `LogEntry`
pub type LogEntryLevel {
  LogEntryLevelVerbose
  LogEntryLevelInfo
  LogEntryLevelWarning
  LogEntryLevelError
}

@internal
pub fn encode__log_entry_level(value__: LogEntryLevel) {
  case value__ {
    LogEntryLevelVerbose -> "verbose"
    LogEntryLevelInfo -> "info"
    LogEntryLevelWarning -> "warning"
    LogEntryLevelError -> "error"
  }
  |> json.string()
}

@internal
pub fn decode__log_entry_level(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("verbose") -> Ok(LogEntryLevelVerbose)
    Ok("info") -> Ok(LogEntryLevelInfo)
    Ok("warning") -> Ok(LogEntryLevelWarning)
    Ok("error") -> Ok(LogEntryLevelError)
    _ -> Error(chrome.ProtocolError)
  }
}

/// This type is not part of the protocol spec, it has been generated dynamically 
/// to represent the possible values of the enum property `category` of `LogEntry`
pub type LogEntryCategory {
  LogEntryCategoryCors
}

@internal
pub fn encode__log_entry_category(value__: LogEntryCategory) {
  case value__ {
    LogEntryCategoryCors -> "cors"
  }
  |> json.string()
}

@internal
pub fn decode__log_entry_category(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("cors") -> Ok(LogEntryCategoryCors)
    _ -> Error(chrome.ProtocolError)
  }
}

@internal
pub fn encode__log_entry(value__: LogEntry) {
  json.object([
    #("source", encode__log_entry_source(value__.source)),
    #("level", encode__log_entry_level(value__.level)),
    #("text", json.string(value__.text)),
    #("category", {
      case value__.category {
        option.Some(value__) -> encode__log_entry_category(value__)
        option.None -> json.null()
      }
    }),
    #("timestamp", runtime.encode__timestamp(value__.timestamp)),
    #("url", {
      case value__.url {
        option.Some(value__) -> json.string(value__)
        option.None -> json.null()
      }
    }),
    #("lineNumber", {
      case value__.line_number {
        option.Some(value__) -> json.int(value__)
        option.None -> json.null()
      }
    }),
    #("stackTrace", {
      case value__.stack_trace {
        option.Some(value__) -> runtime.encode__stack_trace(value__)
        option.None -> json.null()
      }
    }),
    #("networkRequestId", {
      case value__.network_request_id {
        option.Some(value__) -> network.encode__request_id(value__)
        option.None -> json.null()
      }
    }),
    #("workerId", {
      case value__.worker_id {
        option.Some(value__) -> json.string(value__)
        option.None -> json.null()
      }
    }),
    #("args", {
      case value__.args {
        option.Some(value__) ->
          json.array(value__, of: runtime.encode__remote_object)
        option.None -> json.null()
      }
    }),
  ])
}

@internal
pub fn decode__log_entry(value__: dynamic.Dynamic) {
  use source <- result.try(
    dynamic.field("source", decode__log_entry_source)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use level <- result.try(
    dynamic.field("level", decode__log_entry_level)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use text <- result.try(
    dynamic.field("text", dynamic.string)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use category <- result.try(
    dynamic.optional_field("category", decode__log_entry_category)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use timestamp <- result.try(
    dynamic.field("timestamp", runtime.decode__timestamp)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use url <- result.try(
    dynamic.optional_field("url", dynamic.string)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use line_number <- result.try(
    dynamic.optional_field("lineNumber", dynamic.int)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use stack_trace <- result.try(
    dynamic.optional_field("stackTrace", runtime.decode__stack_trace)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use network_request_id <- result.try(
    dynamic.optional_field("networkRequestId", network.decode__request_id)(
      value__,
    )
    |> result.replace_error(chrome.ProtocolError),
  )
  use worker_id <- result.try(
    dynamic.optional_field("workerId", dynamic.string)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use args <- result.try(
    dynamic.optional_field("args", dynamic.list(runtime.decode__remote_object))(
      value__,
    )
    |> result.replace_error(chrome.ProtocolError),
  )

  LogEntry(
    source: source,
    level: level,
    text: text,
    category: category,
    timestamp: timestamp,
    url: url,
    line_number: line_number,
    stack_trace: stack_trace,
    network_request_id: network_request_id,
    worker_id: worker_id,
    args: args,
  )
}

/// Violation configuration setting.
pub type ViolationSetting {
  ViolationSetting(name: ViolationSettingName, threshold: Float)
}

/// This type is not part of the protocol spec, it has been generated dynamically 
/// to represent the possible values of the enum property `name` of `ViolationSetting`
pub type ViolationSettingName {
  ViolationSettingNameLongTask
  ViolationSettingNameLongLayout
  ViolationSettingNameBlockedEvent
  ViolationSettingNameBlockedParser
  ViolationSettingNameDiscouragedApiUse
  ViolationSettingNameHandler
  ViolationSettingNameRecurringHandler
}

@internal
pub fn encode__violation_setting_name(value__: ViolationSettingName) {
  case value__ {
    ViolationSettingNameLongTask -> "longTask"
    ViolationSettingNameLongLayout -> "longLayout"
    ViolationSettingNameBlockedEvent -> "blockedEvent"
    ViolationSettingNameBlockedParser -> "blockedParser"
    ViolationSettingNameDiscouragedApiUse -> "discouragedAPIUse"
    ViolationSettingNameHandler -> "handler"
    ViolationSettingNameRecurringHandler -> "recurringHandler"
  }
  |> json.string()
}

@internal
pub fn decode__violation_setting_name(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("longTask") -> Ok(ViolationSettingNameLongTask)
    Ok("longLayout") -> Ok(ViolationSettingNameLongLayout)
    Ok("blockedEvent") -> Ok(ViolationSettingNameBlockedEvent)
    Ok("blockedParser") -> Ok(ViolationSettingNameBlockedParser)
    Ok("discouragedAPIUse") -> Ok(ViolationSettingNameDiscouragedApiUse)
    Ok("handler") -> Ok(ViolationSettingNameHandler)
    Ok("recurringHandler") -> Ok(ViolationSettingNameRecurringHandler)
    _ -> Error(chrome.ProtocolError)
  }
}

@internal
pub fn encode__violation_setting(value__: ViolationSetting) {
  json.object([
    #("name", encode__violation_setting_name(value__.name)),
    #("threshold", json.float(value__.threshold)),
  ])
}

@internal
pub fn decode__violation_setting(value__: dynamic.Dynamic) {
  use name <- result.try(
    dynamic.field("name", decode__violation_setting_name)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use threshold <- result.try(
    dynamic.field("threshold", dynamic.float)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )

  ViolationSetting(name: name, threshold: threshold)
}
