// Copyright (c) 2021 Bob
// 
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

import Plugin

@_cdecl("createPlugin")
public func createPlugin() -> UnsafeMutableRawPointer {
    return Unmanaged.passRetained(PluginABuilder()).toOpaque()
}

final class PluginABuilder: PluginBuilder {
    override func build() -> PluginInterface {
        PluginA()
    }
}
