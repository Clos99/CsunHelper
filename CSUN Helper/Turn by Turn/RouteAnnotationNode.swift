//
//  RouteAnnotationNode.swift
//  AugmentedReality
//
//  Created by Bibinur on 11/9/19.
//  Copyright © 2019 Bibinur. All rights reserved.
//

import Foundation
import SceneKit
import CoreLocation

open class RouteAnnotationNode: LocationNode {
    
    public let annotationNode: SCNNode
    
    public init(location: CLLocation, color: UIColor? = .blue) {
        
        
        let sphere = SCNBox(width: 1, height: 0.0, length: 50, chamferRadius: 0.25)
        sphere.firstMaterial!.diffuse.contents = color
        sphere.firstMaterial!.specular.contents = UIColor.black
        sphere.firstMaterial!.lightingModel = .phong
        // sphere.firstMaterial!.fillMode = .lines // used for debug purposes
        
        annotationNode = SCNNode()
        annotationNode.geometry = sphere
        
        super.init(location: location)
        scaleRelativeToDistance = true
        
        addChildNode(annotationNode)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

