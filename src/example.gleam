import browser
import chrobot
import gleam/erlang/process
import gleam/io

pub fn main() {
  // let config =
  //   browser.BrowserConfig(
  //     path: "/Users/jonas/Projects/chrobot/chrome/mac_arm-126.0.6458.0/chrome-mac-arm64/Google Chrome for Testing.app",
  //     args: browser.get_default_chrome_args(),
  //     start_timeout: 5000,
  //   )
  // let assert Ok(browser_subject) = browser.launch_with_config(config)
  let assert Ok(browser_subject) = browser.launch()
  io.print("Browser launched ")
  process.sleep_forever()
}
