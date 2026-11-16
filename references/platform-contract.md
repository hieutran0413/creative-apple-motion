# Platform contract
| Target | UI integration | Input and lifecycle |
| --- | --- | --- |
| iOS/iPhone | SwiftUI, UIKit, UIViewRepresentable | Touch, keyboard where present, safe areas, app scenes |
| iPadOS | SwiftUI, UIKit, UIViewRepresentable | Touch, pointer, keyboard, resizable windows and multiple scenes |
| Native macOS | SwiftUI, AppKit, NSViewRepresentable | Mouse, trackpad, keyboard, window resizing and activation |
| Mac Catalyst | UIKit/SwiftUI under Catalyst | Mac interaction adaptation; verify Catalyst availability separately |

Inspect each deployment target and SDK. Use conditional imports/compilation for framework differences and availability checks for API differences. Never assume a single iOS build proves macOS compatibility. Native macOS is not UIKit.
Own mutable UI state on the appropriate actor/thread. Renderers must receive synchronized snapshots when callbacks execute elsewhere; do not silence concurrency errors using unchecked conformance without proving isolation. Read the installed SDK's delegate annotations before deciding renderer isolation.
Reduce Motion, VoiceOver, Dynamic Type and reduced transparency are part of the interaction contract. Expose accessible native alternatives to GPU-only actions. Keep each scene/window's state independent unless sharing is intentional.
