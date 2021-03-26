//
//  File.swift
//  
//
//  Created by Pierre Tacchi on 26/03/21.
//

import simd

@inlinable func sqrt(_ x: SIMD2<Float>) -> SIMD2<Float> { 1 / rsqrt(x) }
@inlinable func sqrt(_ x: SIMD2<Double>) -> SIMD2<Double> { 1 / rsqrt(x) }
@inlinable func sqrt(_ x: SIMD3<Float>) -> SIMD3<Float> { 1 / rsqrt(x) }
@inlinable func sqrt(_ x: SIMD3<Double>) -> SIMD3<Double> { 1 / rsqrt(x) }
@inlinable func sqrt(_ x: SIMD4<Float>) -> SIMD4<Float> { 1 / rsqrt(x) }
@inlinable func sqrt(_ x: SIMD4<Double>) -> SIMD4<Double> { 1 / rsqrt(x) }

