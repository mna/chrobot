//// > ⚙️  This module was generated from the Chrome DevTools Protocol version **1.3**
//// ## Emulation Domain  
////
//// This domain emulates different environments for the page.  
////
//// [📖   View this domain on the DevTools Protocol API Docs](https://chromedevtools.github.io/devtools-protocol/1-3/Emulation/)

// ---------------------------------------------------------------------------
// |  !!!!!!   This is an autogenerated file - Do not edit manually  !!!!!!  |
// | Run ` gleam run -m scripts/generate_protocol_bindings.sh` to regenerate.|  
// ---------------------------------------------------------------------------

import chrobot/internal/utils
import gleam/dynamic
import gleam/json
import gleam/option
import gleam/result
import protocol/dom

/// Screen orientation.
pub type ScreenOrientation {
  ScreenOrientation(type_: ScreenOrientationType, angle: Int)
}

/// This type is not part of the protocol spec, it has been generated dynamically 
/// to represent the possible values of the enum property `type` of `ScreenOrientation`
pub type ScreenOrientationType {
  ScreenOrientationTypePortraitPrimary
  ScreenOrientationTypePortraitSecondary
  ScreenOrientationTypeLandscapePrimary
  ScreenOrientationTypeLandscapeSecondary
}

@internal
pub fn encode__screen_orientation_type(value__: ScreenOrientationType) {
  case value__ {
    ScreenOrientationTypePortraitPrimary -> "portraitPrimary"
    ScreenOrientationTypePortraitSecondary -> "portraitSecondary"
    ScreenOrientationTypeLandscapePrimary -> "landscapePrimary"
    ScreenOrientationTypeLandscapeSecondary -> "landscapeSecondary"
  }
  |> json.string()
}

@internal
pub fn decode__screen_orientation_type(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("portraitPrimary") -> Ok(ScreenOrientationTypePortraitPrimary)
    Ok("portraitSecondary") -> Ok(ScreenOrientationTypePortraitSecondary)
    Ok("landscapePrimary") -> Ok(ScreenOrientationTypeLandscapePrimary)
    Ok("landscapeSecondary") -> Ok(ScreenOrientationTypeLandscapeSecondary)
    Error(error) -> Error(error)
    Ok(other) ->
      Error([
        dynamic.DecodeError(
          expected: "valid enum property",
          found: other,
          path: ["enum decoder"],
        ),
      ])
  }
}

@internal
pub fn encode__screen_orientation(value__: ScreenOrientation) {
  json.object([
    #("type", encode__screen_orientation_type(value__.type_)),
    #("angle", json.int(value__.angle)),
  ])
}

@internal
pub fn decode__screen_orientation(value__: dynamic.Dynamic) {
  use type_ <- result.try(dynamic.field("type", decode__screen_orientation_type)(
    value__,
  ))
  use angle <- result.try(dynamic.field("angle", dynamic.int)(value__))

  Ok(ScreenOrientation(type_: type_, angle: angle))
}

pub type DisplayFeature {
  DisplayFeature(
    orientation: DisplayFeatureOrientation,
    offset: Int,
    mask_length: Int,
  )
}

/// This type is not part of the protocol spec, it has been generated dynamically 
/// to represent the possible values of the enum property `orientation` of `DisplayFeature`
pub type DisplayFeatureOrientation {
  DisplayFeatureOrientationVertical
  DisplayFeatureOrientationHorizontal
}

@internal
pub fn encode__display_feature_orientation(value__: DisplayFeatureOrientation) {
  case value__ {
    DisplayFeatureOrientationVertical -> "vertical"
    DisplayFeatureOrientationHorizontal -> "horizontal"
  }
  |> json.string()
}

@internal
pub fn decode__display_feature_orientation(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("vertical") -> Ok(DisplayFeatureOrientationVertical)
    Ok("horizontal") -> Ok(DisplayFeatureOrientationHorizontal)
    Error(error) -> Error(error)
    Ok(other) ->
      Error([
        dynamic.DecodeError(
          expected: "valid enum property",
          found: other,
          path: ["enum decoder"],
        ),
      ])
  }
}

@internal
pub fn encode__display_feature(value__: DisplayFeature) {
  json.object([
    #("orientation", encode__display_feature_orientation(value__.orientation)),
    #("offset", json.int(value__.offset)),
    #("maskLength", json.int(value__.mask_length)),
  ])
}

@internal
pub fn decode__display_feature(value__: dynamic.Dynamic) {
  use orientation <- result.try(dynamic.field(
    "orientation",
    decode__display_feature_orientation,
  )(value__))
  use offset <- result.try(dynamic.field("offset", dynamic.int)(value__))
  use mask_length <- result.try(dynamic.field("maskLength", dynamic.int)(
    value__,
  ))

  Ok(DisplayFeature(
    orientation: orientation,
    offset: offset,
    mask_length: mask_length,
  ))
}

pub type DevicePosture {
  DevicePosture(type_: DevicePostureType)
}

/// This type is not part of the protocol spec, it has been generated dynamically 
/// to represent the possible values of the enum property `type` of `DevicePosture`
pub type DevicePostureType {
  DevicePostureTypeContinuous
  DevicePostureTypeFolded
}

@internal
pub fn encode__device_posture_type(value__: DevicePostureType) {
  case value__ {
    DevicePostureTypeContinuous -> "continuous"
    DevicePostureTypeFolded -> "folded"
  }
  |> json.string()
}

@internal
pub fn decode__device_posture_type(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("continuous") -> Ok(DevicePostureTypeContinuous)
    Ok("folded") -> Ok(DevicePostureTypeFolded)
    Error(error) -> Error(error)
    Ok(other) ->
      Error([
        dynamic.DecodeError(
          expected: "valid enum property",
          found: other,
          path: ["enum decoder"],
        ),
      ])
  }
}

@internal
pub fn encode__device_posture(value__: DevicePosture) {
  json.object([#("type", encode__device_posture_type(value__.type_))])
}

@internal
pub fn decode__device_posture(value__: dynamic.Dynamic) {
  use type_ <- result.try(dynamic.field("type", decode__device_posture_type)(
    value__,
  ))

  Ok(DevicePosture(type_: type_))
}

pub type MediaFeature {
  MediaFeature(name: String, value: String)
}

@internal
pub fn encode__media_feature(value__: MediaFeature) {
  json.object([
    #("name", json.string(value__.name)),
    #("value", json.string(value__.value)),
  ])
}

@internal
pub fn decode__media_feature(value__: dynamic.Dynamic) {
  use name <- result.try(dynamic.field("name", dynamic.string)(value__))
  use value <- result.try(dynamic.field("value", dynamic.string)(value__))

  Ok(MediaFeature(name: name, value: value))
}

/// Clears the overridden device metrics.
pub fn clear_device_metrics_override(callback__) {
  callback__("Emulation.clearDeviceMetricsOverride", option.None)
}

/// Clears the overridden Geolocation Position and Error.
pub fn clear_geolocation_override(callback__) {
  callback__("Emulation.clearGeolocationOverride", option.None)
}

/// Enables CPU throttling to emulate slow CPUs.
pub fn set_cpu_throttling_rate(callback__, rate: Float) {
  callback__(
    "Emulation.setCPUThrottlingRate",
    option.Some(json.object([#("rate", json.float(rate))])),
  )
}

/// Sets or clears an override of the default background color of the frame. This override is used
/// if the content does not specify one.
pub fn set_default_background_color_override(
  callback__,
  color: option.Option(dom.RGBA),
) {
  callback__(
    "Emulation.setDefaultBackgroundColorOverride",
    option.Some(json.object(
      []
      |> utils.add_optional(color, fn(inner_value__) {
        #("color", dom.encode__rgba(inner_value__))
      }),
    )),
  )
}

/// Overrides the values of device screen dimensions (window.screen.width, window.screen.height,
/// window.innerWidth, window.innerHeight, and "device-width"/"device-height"-related CSS media
/// query results).
pub fn set_device_metrics_override(
  callback__,
  width: Int,
  height: Int,
  device_scale_factor: Float,
  mobile: Bool,
  screen_orientation: option.Option(ScreenOrientation),
) {
  callback__(
    "Emulation.setDeviceMetricsOverride",
    option.Some(json.object(
      [
        #("width", json.int(width)),
        #("height", json.int(height)),
        #("deviceScaleFactor", json.float(device_scale_factor)),
        #("mobile", json.bool(mobile)),
      ]
      |> utils.add_optional(screen_orientation, fn(inner_value__) {
        #("screenOrientation", encode__screen_orientation(inner_value__))
      }),
    )),
  )
}

/// Emulates the given media type or media feature for CSS media queries.
pub fn set_emulated_media(
  callback__,
  media: option.Option(String),
  features: option.Option(List(MediaFeature)),
) {
  callback__(
    "Emulation.setEmulatedMedia",
    option.Some(json.object(
      []
      |> utils.add_optional(media, fn(inner_value__) {
        #("media", json.string(inner_value__))
      })
      |> utils.add_optional(features, fn(inner_value__) {
        #("features", json.array(inner_value__, of: encode__media_feature))
      }),
    )),
  )
}

/// Emulates the given vision deficiency.
pub fn set_emulated_vision_deficiency(
  callback__,
  type_: SetEmulatedVisionDeficiencyType,
) {
  callback__(
    "Emulation.setEmulatedVisionDeficiency",
    option.Some(
      json.object([
        #("type", encode__set_emulated_vision_deficiency_type(type_)),
      ]),
    ),
  )
}

/// This type is not part of the protocol spec, it has been generated dynamically 
/// to represent the possible values of the enum property `type` of `setEmulatedVisionDeficiency`
pub type SetEmulatedVisionDeficiencyType {
  SetEmulatedVisionDeficiencyTypeNone
  SetEmulatedVisionDeficiencyTypeBlurredVision
  SetEmulatedVisionDeficiencyTypeReducedContrast
  SetEmulatedVisionDeficiencyTypeAchromatopsia
  SetEmulatedVisionDeficiencyTypeDeuteranopia
  SetEmulatedVisionDeficiencyTypeProtanopia
  SetEmulatedVisionDeficiencyTypeTritanopia
}

@internal
pub fn encode__set_emulated_vision_deficiency_type(value__: SetEmulatedVisionDeficiencyType) {
  case value__ {
    SetEmulatedVisionDeficiencyTypeNone -> "none"
    SetEmulatedVisionDeficiencyTypeBlurredVision -> "blurredVision"
    SetEmulatedVisionDeficiencyTypeReducedContrast -> "reducedContrast"
    SetEmulatedVisionDeficiencyTypeAchromatopsia -> "achromatopsia"
    SetEmulatedVisionDeficiencyTypeDeuteranopia -> "deuteranopia"
    SetEmulatedVisionDeficiencyTypeProtanopia -> "protanopia"
    SetEmulatedVisionDeficiencyTypeTritanopia -> "tritanopia"
  }
  |> json.string()
}

@internal
pub fn decode__set_emulated_vision_deficiency_type(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("none") -> Ok(SetEmulatedVisionDeficiencyTypeNone)
    Ok("blurredVision") -> Ok(SetEmulatedVisionDeficiencyTypeBlurredVision)
    Ok("reducedContrast") -> Ok(SetEmulatedVisionDeficiencyTypeReducedContrast)
    Ok("achromatopsia") -> Ok(SetEmulatedVisionDeficiencyTypeAchromatopsia)
    Ok("deuteranopia") -> Ok(SetEmulatedVisionDeficiencyTypeDeuteranopia)
    Ok("protanopia") -> Ok(SetEmulatedVisionDeficiencyTypeProtanopia)
    Ok("tritanopia") -> Ok(SetEmulatedVisionDeficiencyTypeTritanopia)
    Error(error) -> Error(error)
    Ok(other) ->
      Error([
        dynamic.DecodeError(
          expected: "valid enum property",
          found: other,
          path: ["enum decoder"],
        ),
      ])
  }
}

/// Overrides the Geolocation Position or Error. Omitting any of the parameters emulates position
/// unavailable.
pub fn set_geolocation_override(
  callback__,
  latitude: option.Option(Float),
  longitude: option.Option(Float),
  accuracy: option.Option(Float),
) {
  callback__(
    "Emulation.setGeolocationOverride",
    option.Some(json.object(
      []
      |> utils.add_optional(latitude, fn(inner_value__) {
        #("latitude", json.float(inner_value__))
      })
      |> utils.add_optional(longitude, fn(inner_value__) {
        #("longitude", json.float(inner_value__))
      })
      |> utils.add_optional(accuracy, fn(inner_value__) {
        #("accuracy", json.float(inner_value__))
      }),
    )),
  )
}

/// Overrides the Idle state.
pub fn set_idle_override(
  callback__,
  is_user_active: Bool,
  is_screen_unlocked: Bool,
) {
  callback__(
    "Emulation.setIdleOverride",
    option.Some(
      json.object([
        #("isUserActive", json.bool(is_user_active)),
        #("isScreenUnlocked", json.bool(is_screen_unlocked)),
      ]),
    ),
  )
}

/// Clears Idle state overrides.
pub fn clear_idle_override(callback__) {
  callback__("Emulation.clearIdleOverride", option.None)
}

/// Switches script execution in the page.
pub fn set_script_execution_disabled(callback__, value: Bool) {
  callback__(
    "Emulation.setScriptExecutionDisabled",
    option.Some(json.object([#("value", json.bool(value))])),
  )
}

/// Enables touch on platforms which do not support them.
pub fn set_touch_emulation_enabled(
  callback__,
  enabled: Bool,
  max_touch_points: option.Option(Int),
) {
  callback__(
    "Emulation.setTouchEmulationEnabled",
    option.Some(json.object(
      [#("enabled", json.bool(enabled))]
      |> utils.add_optional(max_touch_points, fn(inner_value__) {
        #("maxTouchPoints", json.int(inner_value__))
      }),
    )),
  )
}

/// Overrides default host system timezone with the specified one.
pub fn set_timezone_override(callback__, timezone_id: String) {
  callback__(
    "Emulation.setTimezoneOverride",
    option.Some(json.object([#("timezoneId", json.string(timezone_id))])),
  )
}

/// Allows overriding user agent with the given string.
/// `userAgentMetadata` must be set for Client Hint headers to be sent.
pub fn set_user_agent_override(
  callback__,
  user_agent: String,
  accept_language: option.Option(String),
  platform: option.Option(String),
) {
  callback__(
    "Emulation.setUserAgentOverride",
    option.Some(json.object(
      [#("userAgent", json.string(user_agent))]
      |> utils.add_optional(accept_language, fn(inner_value__) {
        #("acceptLanguage", json.string(inner_value__))
      })
      |> utils.add_optional(platform, fn(inner_value__) {
        #("platform", json.string(inner_value__))
      }),
    )),
  )
}
