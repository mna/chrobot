//// > ⚙️  This module was generated from the Chrome DevTools Protocol version **1.3**
//// ## DOM Domain  
////
//// This domain exposes DOM read/write operations. Each DOM Node is represented with its mirror object
//// that has an `id`. This `id` can be used to get additional information on the Node, resolve it into
//// the JavaScript object wrapper, etc. It is important that client receives DOM events only for the
//// nodes that are known to the client. Backend keeps track of the nodes that were sent to the client
//// and never sends the same node twice. It is client's responsibility to collect information about
//// the nodes that were sent to the client. Note that `iframe` owner elements will return
//// corresponding document elements as their child nodes.  
////
//// [📖   View this domain on the DevTools Protocol API Docs](https://chromedevtools.github.io/devtools-protocol/1-3/DOM/)

// ---------------------------------------------------------------------------
// |  !!!!!!   This is an autogenerated file - Do not edit manually  !!!!!!  |
// | Run ` gleam run -m scripts/generate_protocol_bindings.sh` to regenerate.|  
// ---------------------------------------------------------------------------

import chrome
import gleam/dynamic
import gleam/json
import gleam/option
import gleam/result
import protocol/runtime

/// Unique DOM node identifier.
pub type NodeId {
  NodeId(Int)
}

@internal
pub fn encode__node_id(value__: NodeId) {
  case value__ {
    NodeId(inner_value__) -> json.int(inner_value__)
  }
}

@internal
pub fn decode__node_id(value__: dynamic.Dynamic) {
  value__
  |> dynamic.decode1(NodeId, dynamic.int)
  |> result.replace_error(chrome.ProtocolError)
}

/// Unique DOM node identifier used to reference a node that may not have been pushed to the
/// front-end.
pub type BackendNodeId {
  BackendNodeId(Int)
}

@internal
pub fn encode__backend_node_id(value__: BackendNodeId) {
  case value__ {
    BackendNodeId(inner_value__) -> json.int(inner_value__)
  }
}

@internal
pub fn decode__backend_node_id(value__: dynamic.Dynamic) {
  value__
  |> dynamic.decode1(BackendNodeId, dynamic.int)
  |> result.replace_error(chrome.ProtocolError)
}

/// Backend node with a friendly name.
pub type BackendNode {
  BackendNode(node_type: Int, node_name: String, backend_node_id: BackendNodeId)
}

@internal
pub fn encode__backend_node(value__: BackendNode) {
  json.object([
    #("nodeType", json.int(value__.node_type)),
    #("nodeName", json.string(value__.node_name)),
    #("backendNodeId", encode__backend_node_id(value__.backend_node_id)),
  ])
}

@internal
pub fn decode__backend_node(value__: dynamic.Dynamic) {
  use node_type <- result.try(
    dynamic.field("nodeType", dynamic.int)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use node_name <- result.try(
    dynamic.field("nodeName", dynamic.string)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use backend_node_id <- result.try(
    dynamic.field("backendNodeId", decode__backend_node_id)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )

  BackendNode(
    node_type: node_type,
    node_name: node_name,
    backend_node_id: backend_node_id,
  )
}

/// Pseudo element type.
pub type PseudoType {
  PseudoTypeFirstLine
  PseudoTypeFirstLetter
  PseudoTypeBefore
  PseudoTypeAfter
  PseudoTypeMarker
  PseudoTypeBackdrop
  PseudoTypeSelection
  PseudoTypeTargetText
  PseudoTypeSpellingError
  PseudoTypeGrammarError
  PseudoTypeHighlight
  PseudoTypeFirstLineInherited
  PseudoTypeScrollMarker
  PseudoTypeScrollMarkers
  PseudoTypeScrollbar
  PseudoTypeScrollbarThumb
  PseudoTypeScrollbarButton
  PseudoTypeScrollbarTrack
  PseudoTypeScrollbarTrackPiece
  PseudoTypeScrollbarCorner
  PseudoTypeResizer
  PseudoTypeInputListButton
  PseudoTypeViewTransition
  PseudoTypeViewTransitionGroup
  PseudoTypeViewTransitionImagePair
  PseudoTypeViewTransitionOld
  PseudoTypeViewTransitionNew
}

@internal
pub fn encode__pseudo_type(value__: PseudoType) {
  case value__ {
    PseudoTypeFirstLine -> "first-line"
    PseudoTypeFirstLetter -> "first-letter"
    PseudoTypeBefore -> "before"
    PseudoTypeAfter -> "after"
    PseudoTypeMarker -> "marker"
    PseudoTypeBackdrop -> "backdrop"
    PseudoTypeSelection -> "selection"
    PseudoTypeTargetText -> "target-text"
    PseudoTypeSpellingError -> "spelling-error"
    PseudoTypeGrammarError -> "grammar-error"
    PseudoTypeHighlight -> "highlight"
    PseudoTypeFirstLineInherited -> "first-line-inherited"
    PseudoTypeScrollMarker -> "scroll-marker"
    PseudoTypeScrollMarkers -> "scroll-markers"
    PseudoTypeScrollbar -> "scrollbar"
    PseudoTypeScrollbarThumb -> "scrollbar-thumb"
    PseudoTypeScrollbarButton -> "scrollbar-button"
    PseudoTypeScrollbarTrack -> "scrollbar-track"
    PseudoTypeScrollbarTrackPiece -> "scrollbar-track-piece"
    PseudoTypeScrollbarCorner -> "scrollbar-corner"
    PseudoTypeResizer -> "resizer"
    PseudoTypeInputListButton -> "input-list-button"
    PseudoTypeViewTransition -> "view-transition"
    PseudoTypeViewTransitionGroup -> "view-transition-group"
    PseudoTypeViewTransitionImagePair -> "view-transition-image-pair"
    PseudoTypeViewTransitionOld -> "view-transition-old"
    PseudoTypeViewTransitionNew -> "view-transition-new"
  }
  |> json.string()
}

@internal
pub fn decode__pseudo_type(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("first-line") -> Ok(PseudoTypeFirstLine)
    Ok("first-letter") -> Ok(PseudoTypeFirstLetter)
    Ok("before") -> Ok(PseudoTypeBefore)
    Ok("after") -> Ok(PseudoTypeAfter)
    Ok("marker") -> Ok(PseudoTypeMarker)
    Ok("backdrop") -> Ok(PseudoTypeBackdrop)
    Ok("selection") -> Ok(PseudoTypeSelection)
    Ok("target-text") -> Ok(PseudoTypeTargetText)
    Ok("spelling-error") -> Ok(PseudoTypeSpellingError)
    Ok("grammar-error") -> Ok(PseudoTypeGrammarError)
    Ok("highlight") -> Ok(PseudoTypeHighlight)
    Ok("first-line-inherited") -> Ok(PseudoTypeFirstLineInherited)
    Ok("scroll-marker") -> Ok(PseudoTypeScrollMarker)
    Ok("scroll-markers") -> Ok(PseudoTypeScrollMarkers)
    Ok("scrollbar") -> Ok(PseudoTypeScrollbar)
    Ok("scrollbar-thumb") -> Ok(PseudoTypeScrollbarThumb)
    Ok("scrollbar-button") -> Ok(PseudoTypeScrollbarButton)
    Ok("scrollbar-track") -> Ok(PseudoTypeScrollbarTrack)
    Ok("scrollbar-track-piece") -> Ok(PseudoTypeScrollbarTrackPiece)
    Ok("scrollbar-corner") -> Ok(PseudoTypeScrollbarCorner)
    Ok("resizer") -> Ok(PseudoTypeResizer)
    Ok("input-list-button") -> Ok(PseudoTypeInputListButton)
    Ok("view-transition") -> Ok(PseudoTypeViewTransition)
    Ok("view-transition-group") -> Ok(PseudoTypeViewTransitionGroup)
    Ok("view-transition-image-pair") -> Ok(PseudoTypeViewTransitionImagePair)
    Ok("view-transition-old") -> Ok(PseudoTypeViewTransitionOld)
    Ok("view-transition-new") -> Ok(PseudoTypeViewTransitionNew)
    _ -> Error(chrome.ProtocolError)
  }
}

/// Shadow root type.
pub type ShadowRootType {
  ShadowRootTypeUserAgent
  ShadowRootTypeOpen
  ShadowRootTypeClosed
}

@internal
pub fn encode__shadow_root_type(value__: ShadowRootType) {
  case value__ {
    ShadowRootTypeUserAgent -> "user-agent"
    ShadowRootTypeOpen -> "open"
    ShadowRootTypeClosed -> "closed"
  }
  |> json.string()
}

@internal
pub fn decode__shadow_root_type(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("user-agent") -> Ok(ShadowRootTypeUserAgent)
    Ok("open") -> Ok(ShadowRootTypeOpen)
    Ok("closed") -> Ok(ShadowRootTypeClosed)
    _ -> Error(chrome.ProtocolError)
  }
}

/// Document compatibility mode.
pub type CompatibilityMode {
  CompatibilityModeQuirksMode
  CompatibilityModeLimitedQuirksMode
  CompatibilityModeNoQuirksMode
}

@internal
pub fn encode__compatibility_mode(value__: CompatibilityMode) {
  case value__ {
    CompatibilityModeQuirksMode -> "QuirksMode"
    CompatibilityModeLimitedQuirksMode -> "LimitedQuirksMode"
    CompatibilityModeNoQuirksMode -> "NoQuirksMode"
  }
  |> json.string()
}

@internal
pub fn decode__compatibility_mode(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("QuirksMode") -> Ok(CompatibilityModeQuirksMode)
    Ok("LimitedQuirksMode") -> Ok(CompatibilityModeLimitedQuirksMode)
    Ok("NoQuirksMode") -> Ok(CompatibilityModeNoQuirksMode)
    _ -> Error(chrome.ProtocolError)
  }
}

/// ContainerSelector physical axes
pub type PhysicalAxes {
  PhysicalAxesHorizontal
  PhysicalAxesVertical
  PhysicalAxesBoth
}

@internal
pub fn encode__physical_axes(value__: PhysicalAxes) {
  case value__ {
    PhysicalAxesHorizontal -> "Horizontal"
    PhysicalAxesVertical -> "Vertical"
    PhysicalAxesBoth -> "Both"
  }
  |> json.string()
}

@internal
pub fn decode__physical_axes(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("Horizontal") -> Ok(PhysicalAxesHorizontal)
    Ok("Vertical") -> Ok(PhysicalAxesVertical)
    Ok("Both") -> Ok(PhysicalAxesBoth)
    _ -> Error(chrome.ProtocolError)
  }
}

/// ContainerSelector logical axes
pub type LogicalAxes {
  LogicalAxesInline
  LogicalAxesBlock
  LogicalAxesBoth
}

@internal
pub fn encode__logical_axes(value__: LogicalAxes) {
  case value__ {
    LogicalAxesInline -> "Inline"
    LogicalAxesBlock -> "Block"
    LogicalAxesBoth -> "Both"
  }
  |> json.string()
}

@internal
pub fn decode__logical_axes(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("Inline") -> Ok(LogicalAxesInline)
    Ok("Block") -> Ok(LogicalAxesBlock)
    Ok("Both") -> Ok(LogicalAxesBoth)
    _ -> Error(chrome.ProtocolError)
  }
}

/// Physical scroll orientation
pub type ScrollOrientation {
  ScrollOrientationHorizontal
  ScrollOrientationVertical
}

@internal
pub fn encode__scroll_orientation(value__: ScrollOrientation) {
  case value__ {
    ScrollOrientationHorizontal -> "horizontal"
    ScrollOrientationVertical -> "vertical"
  }
  |> json.string()
}

@internal
pub fn decode__scroll_orientation(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("horizontal") -> Ok(ScrollOrientationHorizontal)
    Ok("vertical") -> Ok(ScrollOrientationVertical)
    _ -> Error(chrome.ProtocolError)
  }
}

/// DOM interaction is implemented in terms of mirror objects that represent the actual DOM nodes.
/// DOMNode is a base node mirror type.
pub type Node {
  Node(
    node_id: NodeId,
    parent_id: option.Option(NodeId),
    backend_node_id: BackendNodeId,
    node_type: Int,
    node_name: String,
    local_name: String,
    node_value: String,
    child_node_count: option.Option(Int),
    children: option.Option(List(Node)),
    attributes: option.Option(List(String)),
    document_url: option.Option(String),
    base_url: option.Option(String),
    public_id: option.Option(String),
    system_id: option.Option(String),
    internal_subset: option.Option(String),
    xml_version: option.Option(String),
    name: option.Option(String),
    value: option.Option(String),
    pseudo_type: option.Option(PseudoType),
    pseudo_identifier: option.Option(String),
    shadow_root_type: option.Option(ShadowRootType),
    frame_id: option.Option(String),
    content_document: option.Option(Node),
    shadow_roots: option.Option(List(Node)),
    template_content: option.Option(Node),
    pseudo_elements: option.Option(List(Node)),
    distributed_nodes: option.Option(List(BackendNode)),
    is_svg: option.Option(Bool),
    compatibility_mode: option.Option(CompatibilityMode),
    assigned_slot: option.Option(BackendNode),
  )
}

@internal
pub fn encode__node(value__: Node) {
  json.object([
    #("nodeId", encode__node_id(value__.node_id)),
    #("parentId", {
      case value__.parent_id {
        option.Some(value__) -> encode__node_id(value__)
        option.None -> json.null()
      }
    }),
    #("backendNodeId", encode__backend_node_id(value__.backend_node_id)),
    #("nodeType", json.int(value__.node_type)),
    #("nodeName", json.string(value__.node_name)),
    #("localName", json.string(value__.local_name)),
    #("nodeValue", json.string(value__.node_value)),
    #("childNodeCount", {
      case value__.child_node_count {
        option.Some(value__) -> json.int(value__)
        option.None -> json.null()
      }
    }),
    #("children", {
      case value__.children {
        option.Some(value__) -> json.array(value__, of: encode__node)
        option.None -> json.null()
      }
    }),
    #("attributes", {
      case value__.attributes {
        option.Some(value__) -> json.array(value__, of: json.string)
        option.None -> json.null()
      }
    }),
    #("documentURL", {
      case value__.document_url {
        option.Some(value__) -> json.string(value__)
        option.None -> json.null()
      }
    }),
    #("baseURL", {
      case value__.base_url {
        option.Some(value__) -> json.string(value__)
        option.None -> json.null()
      }
    }),
    #("publicId", {
      case value__.public_id {
        option.Some(value__) -> json.string(value__)
        option.None -> json.null()
      }
    }),
    #("systemId", {
      case value__.system_id {
        option.Some(value__) -> json.string(value__)
        option.None -> json.null()
      }
    }),
    #("internalSubset", {
      case value__.internal_subset {
        option.Some(value__) -> json.string(value__)
        option.None -> json.null()
      }
    }),
    #("xmlVersion", {
      case value__.xml_version {
        option.Some(value__) -> json.string(value__)
        option.None -> json.null()
      }
    }),
    #("name", {
      case value__.name {
        option.Some(value__) -> json.string(value__)
        option.None -> json.null()
      }
    }),
    #("value", {
      case value__.value {
        option.Some(value__) -> json.string(value__)
        option.None -> json.null()
      }
    }),
    #("pseudoType", {
      case value__.pseudo_type {
        option.Some(value__) -> encode__pseudo_type(value__)
        option.None -> json.null()
      }
    }),
    #("pseudoIdentifier", {
      case value__.pseudo_identifier {
        option.Some(value__) -> json.string(value__)
        option.None -> json.null()
      }
    }),
    #("shadowRootType", {
      case value__.shadow_root_type {
        option.Some(value__) -> encode__shadow_root_type(value__)
        option.None -> json.null()
      }
    }),
    #("frameId", {
      case value__.frame_id {
        option.Some(value__) -> json.string(value__)
        option.None -> json.null()
      }
    }),
    #("contentDocument", {
      case value__.content_document {
        option.Some(value__) -> encode__node(value__)
        option.None -> json.null()
      }
    }),
    #("shadowRoots", {
      case value__.shadow_roots {
        option.Some(value__) -> json.array(value__, of: encode__node)
        option.None -> json.null()
      }
    }),
    #("templateContent", {
      case value__.template_content {
        option.Some(value__) -> encode__node(value__)
        option.None -> json.null()
      }
    }),
    #("pseudoElements", {
      case value__.pseudo_elements {
        option.Some(value__) -> json.array(value__, of: encode__node)
        option.None -> json.null()
      }
    }),
    #("distributedNodes", {
      case value__.distributed_nodes {
        option.Some(value__) -> json.array(value__, of: encode__backend_node)
        option.None -> json.null()
      }
    }),
    #("isSVG", {
      case value__.is_svg {
        option.Some(value__) -> json.bool(value__)
        option.None -> json.null()
      }
    }),
    #("compatibilityMode", {
      case value__.compatibility_mode {
        option.Some(value__) -> encode__compatibility_mode(value__)
        option.None -> json.null()
      }
    }),
    #("assignedSlot", {
      case value__.assigned_slot {
        option.Some(value__) -> encode__backend_node(value__)
        option.None -> json.null()
      }
    }),
  ])
}

@internal
pub fn decode__node(value__: dynamic.Dynamic) {
  use node_id <- result.try(
    dynamic.field("nodeId", decode__node_id)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use parent_id <- result.try(
    dynamic.optional_field("parentId", decode__node_id)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use backend_node_id <- result.try(
    dynamic.field("backendNodeId", decode__backend_node_id)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use node_type <- result.try(
    dynamic.field("nodeType", dynamic.int)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use node_name <- result.try(
    dynamic.field("nodeName", dynamic.string)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use local_name <- result.try(
    dynamic.field("localName", dynamic.string)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use node_value <- result.try(
    dynamic.field("nodeValue", dynamic.string)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use child_node_count <- result.try(
    dynamic.optional_field("childNodeCount", dynamic.int)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use children <- result.try(
    dynamic.optional_field("children", dynamic.list(decode__node))(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use attributes <- result.try(
    dynamic.optional_field("attributes", dynamic.list(string))(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use document_url <- result.try(
    dynamic.optional_field("documentURL", dynamic.string)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use base_url <- result.try(
    dynamic.optional_field("baseURL", dynamic.string)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use public_id <- result.try(
    dynamic.optional_field("publicId", dynamic.string)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use system_id <- result.try(
    dynamic.optional_field("systemId", dynamic.string)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use internal_subset <- result.try(
    dynamic.optional_field("internalSubset", dynamic.string)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use xml_version <- result.try(
    dynamic.optional_field("xmlVersion", dynamic.string)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use name <- result.try(
    dynamic.optional_field("name", dynamic.string)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use value <- result.try(
    dynamic.optional_field("value", dynamic.string)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use pseudo_type <- result.try(
    dynamic.optional_field("pseudoType", decode__pseudo_type)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use pseudo_identifier <- result.try(
    dynamic.optional_field("pseudoIdentifier", dynamic.string)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use shadow_root_type <- result.try(
    dynamic.optional_field("shadowRootType", decode__shadow_root_type)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use frame_id <- result.try(
    dynamic.optional_field("frameId", dynamic.string)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use content_document <- result.try(
    dynamic.optional_field("contentDocument", decode__node)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use shadow_roots <- result.try(
    dynamic.optional_field("shadowRoots", dynamic.list(decode__node))(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use template_content <- result.try(
    dynamic.optional_field("templateContent", decode__node)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use pseudo_elements <- result.try(
    dynamic.optional_field("pseudoElements", dynamic.list(decode__node))(
      value__,
    )
    |> result.replace_error(chrome.ProtocolError),
  )
  use distributed_nodes <- result.try(
    dynamic.optional_field(
      "distributedNodes",
      dynamic.list(decode__backend_node),
    )(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use is_svg <- result.try(
    dynamic.optional_field("isSVG", dynamic.bool)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use compatibility_mode <- result.try(
    dynamic.optional_field("compatibilityMode", decode__compatibility_mode)(
      value__,
    )
    |> result.replace_error(chrome.ProtocolError),
  )
  use assigned_slot <- result.try(
    dynamic.optional_field("assignedSlot", decode__backend_node)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )

  Node(
    node_id: node_id,
    parent_id: parent_id,
    backend_node_id: backend_node_id,
    node_type: node_type,
    node_name: node_name,
    local_name: local_name,
    node_value: node_value,
    child_node_count: child_node_count,
    children: children,
    attributes: attributes,
    document_url: document_url,
    base_url: base_url,
    public_id: public_id,
    system_id: system_id,
    internal_subset: internal_subset,
    xml_version: xml_version,
    name: name,
    value: value,
    pseudo_type: pseudo_type,
    pseudo_identifier: pseudo_identifier,
    shadow_root_type: shadow_root_type,
    frame_id: frame_id,
    content_document: content_document,
    shadow_roots: shadow_roots,
    template_content: template_content,
    pseudo_elements: pseudo_elements,
    distributed_nodes: distributed_nodes,
    is_svg: is_svg,
    compatibility_mode: compatibility_mode,
    assigned_slot: assigned_slot,
  )
}

/// A structure holding an RGBA color.
pub type RGBA {
  RGBA(r: Int, g: Int, b: Int, a: option.Option(Float))
}

@internal
pub fn encode__rgba(value__: RGBA) {
  json.object([
    #("r", json.int(value__.r)),
    #("g", json.int(value__.g)),
    #("b", json.int(value__.b)),
    #("a", {
      case value__.a {
        option.Some(value__) -> json.float(value__)
        option.None -> json.null()
      }
    }),
  ])
}

@internal
pub fn decode__rgba(value__: dynamic.Dynamic) {
  use r <- result.try(
    dynamic.field("r", dynamic.int)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use g <- result.try(
    dynamic.field("g", dynamic.int)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use b <- result.try(
    dynamic.field("b", dynamic.int)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use a <- result.try(
    dynamic.optional_field("a", dynamic.float)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )

  RGBA(r: r, g: g, b: b, a: a)
}

/// An array of quad vertices, x immediately followed by y for each point, points clock-wise.
pub type Quad {
  Quad(List(Float))
}

@internal
pub fn encode__quad(value__: Quad) {
  case value__ {
    Quad(inner_value__) -> json.array(inner_value__, of: json.float)
  }
}

@internal
pub fn decode__quad(value__: dynamic.Dynamic) {
  value__
  |> dynamic.decode1(Quad, dynamic.list(dynamic.float))
  |> result.replace_error(chrome.ProtocolError)
}

/// Box model.
pub type BoxModel {
  BoxModel(
    content: Quad,
    padding: Quad,
    border: Quad,
    margin: Quad,
    width: Int,
    height: Int,
    shape_outside: option.Option(ShapeOutsideInfo),
  )
}

@internal
pub fn encode__box_model(value__: BoxModel) {
  json.object([
    #("content", encode__quad(value__.content)),
    #("padding", encode__quad(value__.padding)),
    #("border", encode__quad(value__.border)),
    #("margin", encode__quad(value__.margin)),
    #("width", json.int(value__.width)),
    #("height", json.int(value__.height)),
    #("shapeOutside", {
      case value__.shape_outside {
        option.Some(value__) -> encode__shape_outside_info(value__)
        option.None -> json.null()
      }
    }),
  ])
}

@internal
pub fn decode__box_model(value__: dynamic.Dynamic) {
  use content <- result.try(
    dynamic.field("content", decode__quad)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use padding <- result.try(
    dynamic.field("padding", decode__quad)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use border <- result.try(
    dynamic.field("border", decode__quad)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use margin <- result.try(
    dynamic.field("margin", decode__quad)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use width <- result.try(
    dynamic.field("width", dynamic.int)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use height <- result.try(
    dynamic.field("height", dynamic.int)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use shape_outside <- result.try(
    dynamic.optional_field("shapeOutside", decode__shape_outside_info)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )

  BoxModel(
    content: content,
    padding: padding,
    border: border,
    margin: margin,
    width: width,
    height: height,
    shape_outside: shape_outside,
  )
}

/// CSS Shape Outside details.
pub type ShapeOutsideInfo {
  ShapeOutsideInfo(
    bounds: Quad,
    shape: List(dynamic.Dynamic),
    margin_shape: List(dynamic.Dynamic),
  )
}

@internal
pub fn encode__shape_outside_info(value__: ShapeOutsideInfo) {
  json.object([
    #("bounds", encode__quad(value__.bounds)),
    #(
      "shape",
      // dynamic values cannot be encoded!
      json.null(),
    ),
    #(
      "marginShape",
      // dynamic values cannot be encoded!
      json.null(),
    ),
  ])
}

@internal
pub fn decode__shape_outside_info(value__: dynamic.Dynamic) {
  use bounds <- result.try(
    dynamic.field("bounds", decode__quad)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use shape <- result.try(
    dynamic.field("shape", dynamic.list(dynamic))(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use margin_shape <- result.try(
    dynamic.field("marginShape", dynamic.list(dynamic))(value__)
    |> result.replace_error(chrome.ProtocolError),
  )

  ShapeOutsideInfo(bounds: bounds, shape: shape, margin_shape: margin_shape)
}

/// Rectangle.
pub type Rect {
  Rect(x: Float, y: Float, width: Float, height: Float)
}

@internal
pub fn encode__rect(value__: Rect) {
  json.object([
    #("x", json.float(value__.x)),
    #("y", json.float(value__.y)),
    #("width", json.float(value__.width)),
    #("height", json.float(value__.height)),
  ])
}

@internal
pub fn decode__rect(value__: dynamic.Dynamic) {
  use x <- result.try(
    dynamic.field("x", dynamic.float)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use y <- result.try(
    dynamic.field("y", dynamic.float)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use width <- result.try(
    dynamic.field("width", dynamic.float)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use height <- result.try(
    dynamic.field("height", dynamic.float)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )

  Rect(x: x, y: y, width: width, height: height)
}

pub type CSSComputedStyleProperty {
  CSSComputedStyleProperty(name: String, value: String)
}

@internal
pub fn encode__css_computed_style_property(value__: CSSComputedStyleProperty) {
  json.object([
    #("name", json.string(value__.name)),
    #("value", json.string(value__.value)),
  ])
}

@internal
pub fn decode__css_computed_style_property(value__: dynamic.Dynamic) {
  use name <- result.try(
    dynamic.field("name", dynamic.string)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )
  use value <- result.try(
    dynamic.field("value", dynamic.string)(value__)
    |> result.replace_error(chrome.ProtocolError),
  )

  CSSComputedStyleProperty(name: name, value: value)
}
