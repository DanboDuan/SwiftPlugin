// Copyright (c) 2021 Bob
// 
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

import Foundation
import Plugin

typealias InitFunction = @convention(c) () -> UnsafeMutableRawPointer

func plugin(at path: String) -> PluginInterface {
    let openRes = dlopen(path, RTLD_NOW | RTLD_LOCAL)
    if openRes != nil {
        defer {
            dlclose(openRes)
        }

        let symbolName = "createPlugin"
        let sym = dlsym(openRes, symbolName)

        if sym != nil {
            let f: InitFunction = unsafeBitCast(sym, to: InitFunction.self)
            let pluginPointer = f()
            let builder = Unmanaged<PluginBuilder>.fromOpaque(pluginPointer).takeRetainedValue()
            return builder.build()
        }
        else {
            fatalError("error loading lib: symbol \(symbolName) not found, path: \(path)")
        }
    }
    else {
        if let err = dlerror() {
            fatalError("error opening lib: \(String(format: "%s", err)), path: \(path)")
        }
        else {
            fatalError("error opening lib: unknown error, path: \(path)")
        }
    }
}

let myPlugin = plugin(at: "/Users/bob/Workspace/Github/Plugin/.build/debug/libPluginA.dylib")
let a = myPlugin.foo()
print(a)
