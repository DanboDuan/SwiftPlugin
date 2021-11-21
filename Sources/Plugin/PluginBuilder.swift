// Copyright (c) 2021 Bob
// 
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

open class PluginBuilder {
    
    public init() {}

    open func build() -> PluginInterface {
        fatalError("You have to override this method.")
    }
}
