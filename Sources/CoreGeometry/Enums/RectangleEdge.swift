//
//  RectangleEdge.swift
//
//  CoreGeometry
//
//  MIT License
//
//  Copyright (c) 2020 Pierre Tacchi
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//


import CoreGraphics

public struct RectangleEdge: OptionSet {
    public let rawValue: Int
    
    @usableFromInline
    var cgRectEdges: [CGRectEdge] {
        [Self.minXEdge, .minYEdge, .maxXEdge, .maxYEdge].lazy.compactMap {
            self.contains($0) ? UInt32(log2(Double($0.rawValue))) : nil
        }.compactMap {
            CGRectEdge(rawValue: $0)
        }
    }
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let minXEdge: RectangleEdge = .init(rawValue: 1 << 0)
    public static let minYEdge: RectangleEdge = .init(rawValue: 1 << 1)
    public static let maxXEdge: RectangleEdge = .init(rawValue: 1 << 2)
    public static let maxYEdge: RectangleEdge = .init(rawValue: 1 << 3)
    
    public static let all: RectangleEdge = [.minXEdge, .minYEdge, .maxXEdge, .maxYEdge]
    public static let horizontal: RectangleEdge = [.minXEdge, .maxXEdge]
    public static let vertical: RectangleEdge = [.minYEdge, .maxYEdge]
}
