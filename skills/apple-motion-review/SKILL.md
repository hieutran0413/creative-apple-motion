---
name: apple-motion-review
description: Audit and verify SwiftUI, UIKit, AppKit and Metal app motion across iPhone, iPad and Mac. Use for animation regressions, reduced motion, adaptive windows, lifecycle leaks, shader output and GPU performance review.
---
# Apple Motion Review

Review the requested surface and current implementation. Audit-only work produces findings; implementation work includes fixes within scope. Read ../../references/art-direction.md and ../../references/platform-contract.md.

## Evidence and build
Identify schemes, build settings, OS versions, deployment targets and available devices. Use xcodebuild -list and -showdestinations where applicable; choose actual destinations rather than inventing IDs. Respect project scripts and signing configuration. Do not change signing to work around an unrelated verification issue.
Run relevant builds and behavior tests. Shader compilation and Swift type checking are separate evidence from app execution. Do not introduce tests that merely assert the implementation text.

## Runtime matrix
For each relevant case record action, expected behavior, observation and evidence using ../../templates/verification.md.
1. Launch, navigate, select, dismiss and return. Repeat rapidly, reverse midway and cancel gestures; no stuck interaction or stale completion.
2. iPhone: compact layout, safe areas, rotation where supported, touch gestures and system navigation.
3. iPad: narrow/wide windows, multitasking, pointer, keyboard and touch. Test resize while animation runs; do not infer layout only from device class.
4. Mac: resize and multiple windows, keyboard focus, shortcuts, mouse/trackpad, scroll and window activation. Record native macOS versus Catalyst.
5. Accessibility: Reduce Motion at launch and live changes, VoiceOver labels/order/actions, Dynamic Type, contrast and Reduce Transparency where applicable. All essential actions remain accessible without GPU interaction.
6. Lifecycle: appear/disappear repeatedly, background/foreground, scene/window close and reopen, stale asset completion. Observe whether loops and resources actually stop; source inspection alone cannot prove no leaks.
7. Graphics resilience: missing/failed assets, shader errors, unsupported features, zero-size or missing drawable, scaled display and transparent edges. Keep actionable native fallback.
8. Performance: measure frame pacing, CPU/GPU time and allocations with appropriate profiling tools when required. Record hardware, refresh rate, scene, duration and quality tier. Use frame budgets matching the actual target; do not infer 60/120 fps or battery efficiency from a screenshot or build.

## Report
Prioritize reproducible defects with locations and user impact. Distinguish static inspection, compiler checks, simulator execution, Mac runtime, physical iPhone/iPad observations and profiling. Mark unavailable tests as not run with a concrete next step. No actionable issues within the tested scope does not mean universally bug-free.
