//// > ⚙️  This module was generated from the Chrome DevTools Protocol version **1.3**
//// ## Fetch Domain  
////
//// A domain for letting clients substitute browser's network layer with client code.  
////
//// [📖   View this domain on the DevTools Protocol API Docs](https://chromedevtools.github.io/devtools-protocol/1-3/Fetch/)

// ---------------------------------------------------------------------------
// |  !!!!!!   This is an autogenerated file - Do not edit manually  !!!!!!  |
// | Run ` gleam run -m scripts/generate_protocol_bindings.sh` to regenerate.|  
// ---------------------------------------------------------------------------

import chrome
import gleam/dynamic
import gleam/json
import gleam/option
import gleam/result
import protocol/io
import protocol/network
import protocol/page

/// Unique request identifier.
pub type RequestId {
  RequestId(String)
}

@internal
pub fn encode__request_id(value__: RequestId) {
  case value__ {
    RequestId(inner_value__) -> json.string(inner_value__)
  }
}

@internal
pub fn decode__request_id(value__: dynamic.Dynamic) {
  value__
  |> dynamic.decode1(RequestId, dynamic.string)
}

/// Stages of the request to handle. Request will intercept before the request is
/// sent. Response will intercept after the response is received (but before response
/// body is received).
pub type RequestStage {
  RequestStageRequest
  RequestStageResponse
}

@internal
pub fn encode__request_stage(value__: RequestStage) {
  case value__ {
    RequestStageRequest -> "Request"
    RequestStageResponse -> "Response"
  }
  |> json.string()
}

@internal
pub fn decode__request_stage(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("Request") -> Ok(RequestStageRequest)
    Ok("Response") -> Ok(RequestStageResponse)
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

pub type RequestPattern {
  RequestPattern(
    url_pattern: option.Option(String),
    resource_type: option.Option(network.ResourceType),
    request_stage: option.Option(RequestStage),
  )
}

@internal
pub fn encode__request_pattern(value__: RequestPattern) {
  json.object([
    #("urlPattern", {
      case value__.url_pattern {
        option.Some(value__) -> json.string(value__)
        option.None -> json.null()
      }
    }),
    #("resourceType", {
      case value__.resource_type {
        option.Some(value__) -> network.encode__resource_type(value__)
        option.None -> json.null()
      }
    }),
    #("requestStage", {
      case value__.request_stage {
        option.Some(value__) -> encode__request_stage(value__)
        option.None -> json.null()
      }
    }),
  ])
}

@internal
pub fn decode__request_pattern(value__: dynamic.Dynamic) {
  use url_pattern <- result.try(dynamic.optional_field(
    "urlPattern",
    dynamic.string,
  )(value__))
  use resource_type <- result.try(dynamic.optional_field(
    "resourceType",
    network.decode__resource_type,
  )(value__))
  use request_stage <- result.try(dynamic.optional_field(
    "requestStage",
    decode__request_stage,
  )(value__))

  Ok(RequestPattern(
    url_pattern: url_pattern,
    resource_type: resource_type,
    request_stage: request_stage,
  ))
}

/// Response HTTP header entry
pub type HeaderEntry {
  HeaderEntry(name: String, value: String)
}

@internal
pub fn encode__header_entry(value__: HeaderEntry) {
  json.object([
    #("name", json.string(value__.name)),
    #("value", json.string(value__.value)),
  ])
}

@internal
pub fn decode__header_entry(value__: dynamic.Dynamic) {
  use name <- result.try(dynamic.field("name", dynamic.string)(value__))
  use value <- result.try(dynamic.field("value", dynamic.string)(value__))

  Ok(HeaderEntry(name: name, value: value))
}

/// Authorization challenge for HTTP status code 401 or 407.
pub type AuthChallenge {
  AuthChallenge(
    source: option.Option(AuthChallengeSource),
    origin: String,
    scheme: String,
    realm: String,
  )
}

/// This type is not part of the protocol spec, it has been generated dynamically 
/// to represent the possible values of the enum property `source` of `AuthChallenge`
pub type AuthChallengeSource {
  AuthChallengeSourceServer
  AuthChallengeSourceProxy
}

@internal
pub fn encode__auth_challenge_source(value__: AuthChallengeSource) {
  case value__ {
    AuthChallengeSourceServer -> "Server"
    AuthChallengeSourceProxy -> "Proxy"
  }
  |> json.string()
}

@internal
pub fn decode__auth_challenge_source(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("Server") -> Ok(AuthChallengeSourceServer)
    Ok("Proxy") -> Ok(AuthChallengeSourceProxy)
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
pub fn encode__auth_challenge(value__: AuthChallenge) {
  json.object([
    #("source", {
      case value__.source {
        option.Some(value__) -> encode__auth_challenge_source(value__)
        option.None -> json.null()
      }
    }),
    #("origin", json.string(value__.origin)),
    #("scheme", json.string(value__.scheme)),
    #("realm", json.string(value__.realm)),
  ])
}

@internal
pub fn decode__auth_challenge(value__: dynamic.Dynamic) {
  use source <- result.try(dynamic.optional_field(
    "source",
    decode__auth_challenge_source,
  )(value__))
  use origin <- result.try(dynamic.field("origin", dynamic.string)(value__))
  use scheme <- result.try(dynamic.field("scheme", dynamic.string)(value__))
  use realm <- result.try(dynamic.field("realm", dynamic.string)(value__))

  Ok(AuthChallenge(source: source, origin: origin, scheme: scheme, realm: realm))
}

/// Response to an AuthChallenge.
pub type AuthChallengeResponse {
  AuthChallengeResponse(
    response: AuthChallengeResponseResponse,
    username: option.Option(String),
    password: option.Option(String),
  )
}

/// This type is not part of the protocol spec, it has been generated dynamically 
/// to represent the possible values of the enum property `response` of `AuthChallengeResponse`
pub type AuthChallengeResponseResponse {
  AuthChallengeResponseResponseDefault
  AuthChallengeResponseResponseCancelAuth
  AuthChallengeResponseResponseProvideCredentials
}

@internal
pub fn encode__auth_challenge_response_response(value__: AuthChallengeResponseResponse) {
  case value__ {
    AuthChallengeResponseResponseDefault -> "Default"
    AuthChallengeResponseResponseCancelAuth -> "CancelAuth"
    AuthChallengeResponseResponseProvideCredentials -> "ProvideCredentials"
  }
  |> json.string()
}

@internal
pub fn decode__auth_challenge_response_response(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("Default") -> Ok(AuthChallengeResponseResponseDefault)
    Ok("CancelAuth") -> Ok(AuthChallengeResponseResponseCancelAuth)
    Ok("ProvideCredentials") ->
      Ok(AuthChallengeResponseResponseProvideCredentials)
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
pub fn encode__auth_challenge_response(value__: AuthChallengeResponse) {
  json.object([
    #("response", encode__auth_challenge_response_response(value__.response)),
    #("username", {
      case value__.username {
        option.Some(value__) -> json.string(value__)
        option.None -> json.null()
      }
    }),
    #("password", {
      case value__.password {
        option.Some(value__) -> json.string(value__)
        option.None -> json.null()
      }
    }),
  ])
}

@internal
pub fn decode__auth_challenge_response(value__: dynamic.Dynamic) {
  use response <- result.try(dynamic.field(
    "response",
    decode__auth_challenge_response_response,
  )(value__))
  use username <- result.try(dynamic.optional_field("username", dynamic.string)(
    value__,
  ))
  use password <- result.try(dynamic.optional_field("password", dynamic.string)(
    value__,
  ))

  Ok(AuthChallengeResponse(
    response: response,
    username: username,
    password: password,
  ))
}

/// This type is not part of the protocol spec, it has been generated dynamically
/// to represent the response to the command `get_response_body`
pub type GetResponseBodyResponse {
  GetResponseBodyResponse(body: String, base64_encoded: Bool)
}

@internal
pub fn decode__get_response_body_response(value__: dynamic.Dynamic) {
  use body <- result.try(dynamic.field("body", dynamic.string)(value__))
  use base64_encoded <- result.try(dynamic.field("base64Encoded", dynamic.bool)(
    value__,
  ))

  Ok(GetResponseBodyResponse(body: body, base64_encoded: base64_encoded))
}

/// This type is not part of the protocol spec, it has been generated dynamically
/// to represent the response to the command `take_response_body_as_stream`
pub type TakeResponseBodyAsStreamResponse {
  TakeResponseBodyAsStreamResponse(stream: io.StreamHandle)
}

@internal
pub fn decode__take_response_body_as_stream_response(value__: dynamic.Dynamic) {
  use stream <- result.try(dynamic.field("stream", io.decode__stream_handle)(
    value__,
  ))

  Ok(TakeResponseBodyAsStreamResponse(stream: stream))
}

/// Disables the fetch domain.
pub fn disable(browser_subject) {
  let _ = chrome.call(browser_subject, "Fetch.disable", option.None, 10_000)
  Nil
}

/// Enables issuing of requestPaused events. A request will be paused until client
/// calls one of failRequest, fulfillRequest or continueRequest/continueWithAuth.
pub fn enable(
  browser_subject,
  patterns: option.Option(List(RequestPattern)),
  handle_auth_requests: option.Option(Bool),
) {
  let _ =
    chrome.call(
      browser_subject,
      "Fetch.enable",
      option.Some(
        json.object([
          #("patterns", {
            case patterns {
              option.Some(value__) ->
                json.array(value__, of: encode__request_pattern)
              option.None -> json.null()
            }
          }),
          #("handleAuthRequests", {
            case handle_auth_requests {
              option.Some(value__) -> json.bool(value__)
              option.None -> json.null()
            }
          }),
        ]),
      ),
      10_000,
    )
  Nil
}

/// Causes the request to fail with specified reason.
pub fn fail_request(
  browser_subject,
  request_id: RequestId,
  error_reason: network.ErrorReason,
) {
  let _ =
    chrome.call(
      browser_subject,
      "Fetch.failRequest",
      option.Some(
        json.object([
          #("requestId", encode__request_id(request_id)),
          #("errorReason", network.encode__error_reason(error_reason)),
        ]),
      ),
      10_000,
    )
  Nil
}

/// Provides response to the request.
pub fn fulfill_request(
  browser_subject,
  request_id: RequestId,
  response_code: Int,
  response_headers: option.Option(List(HeaderEntry)),
  binary_response_headers: option.Option(String),
  body: option.Option(String),
  response_phrase: option.Option(String),
) {
  let _ =
    chrome.call(
      browser_subject,
      "Fetch.fulfillRequest",
      option.Some(
        json.object([
          #("requestId", encode__request_id(request_id)),
          #("responseCode", json.int(response_code)),
          #("responseHeaders", {
            case response_headers {
              option.Some(value__) ->
                json.array(value__, of: encode__header_entry)
              option.None -> json.null()
            }
          }),
          #("binaryResponseHeaders", {
            case binary_response_headers {
              option.Some(value__) -> json.string(value__)
              option.None -> json.null()
            }
          }),
          #("body", {
            case body {
              option.Some(value__) -> json.string(value__)
              option.None -> json.null()
            }
          }),
          #("responsePhrase", {
            case response_phrase {
              option.Some(value__) -> json.string(value__)
              option.None -> json.null()
            }
          }),
        ]),
      ),
      10_000,
    )
  Nil
}

/// Continues the request, optionally modifying some of its parameters.
pub fn continue_request(
  browser_subject,
  request_id: RequestId,
  url: option.Option(String),
  method: option.Option(String),
  post_data: option.Option(String),
  headers: option.Option(List(HeaderEntry)),
) {
  let _ =
    chrome.call(
      browser_subject,
      "Fetch.continueRequest",
      option.Some(
        json.object([
          #("requestId", encode__request_id(request_id)),
          #("url", {
            case url {
              option.Some(value__) -> json.string(value__)
              option.None -> json.null()
            }
          }),
          #("method", {
            case method {
              option.Some(value__) -> json.string(value__)
              option.None -> json.null()
            }
          }),
          #("postData", {
            case post_data {
              option.Some(value__) -> json.string(value__)
              option.None -> json.null()
            }
          }),
          #("headers", {
            case headers {
              option.Some(value__) ->
                json.array(value__, of: encode__header_entry)
              option.None -> json.null()
            }
          }),
        ]),
      ),
      10_000,
    )
  Nil
}

/// Continues a request supplying authChallengeResponse following authRequired event.
pub fn continue_with_auth(
  browser_subject,
  request_id: RequestId,
  auth_challenge_response: AuthChallengeResponse,
) {
  let _ =
    chrome.call(
      browser_subject,
      "Fetch.continueWithAuth",
      option.Some(
        json.object([
          #("requestId", encode__request_id(request_id)),
          #(
            "authChallengeResponse",
            encode__auth_challenge_response(auth_challenge_response),
          ),
        ]),
      ),
      10_000,
    )
  Nil
}

/// Causes the body of the response to be received from the server and
/// returned as a single string. May only be issued for a request that
/// is paused in the Response stage and is mutually exclusive with
/// takeResponseBodyForInterceptionAsStream. Calling other methods that
/// affect the request or disabling fetch domain before body is received
/// results in an undefined behavior.
/// Note that the response body is not available for redirects. Requests
/// paused in the _redirect received_ state may be differentiated by
/// `responseCode` and presence of `location` response header, see
/// comments to `requestPaused` for details.
pub fn get_response_body(browser_subject, request_id: RequestId) {
  chrome.call(
    browser_subject,
    "Fetch.getResponseBody",
    option.Some(json.object([#("requestId", encode__request_id(request_id))])),
    10_000,
  )
  |> result.try(fn(result__) {
    decode__get_response_body_response(result__)
    |> result.replace_error(chrome.ProtocolError)
  })
}

/// Returns a handle to the stream representing the response body.
/// The request must be paused in the HeadersReceived stage.
/// Note that after this command the request can't be continued
/// as is -- client either needs to cancel it or to provide the
/// response body.
/// The stream only supports sequential read, IO.read will fail if the position
/// is specified.
/// This method is mutually exclusive with getResponseBody.
/// Calling other methods that affect the request or disabling fetch
/// domain before body is received results in an undefined behavior.
pub fn take_response_body_as_stream(browser_subject, request_id: RequestId) {
  chrome.call(
    browser_subject,
    "Fetch.takeResponseBodyAsStream",
    option.Some(json.object([#("requestId", encode__request_id(request_id))])),
    10_000,
  )
  |> result.try(fn(result__) {
    decode__take_response_body_as_stream_response(result__)
    |> result.replace_error(chrome.ProtocolError)
  })
}
