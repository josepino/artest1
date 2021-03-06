//
//  ViewController.swift
//  ARTest
//
//  Created by Jose Pino on 12/12/17.
//  Copyright © 2017 Jose Pino. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
    


        // Creamos la esfera
        let sphere = SCNSphere(radius: 20)
        
        // Creamos el material
        let material = SCNMaterial()
        
        material.diffuse.contents = UIImage(named: "art.scnassets/sun.jpg")
        
        
        
        sphere.materials = [material]
        
        
        // Creamos el nodo y ponemos su posicion en el espacio XYZ
        let node = SCNNode()
        node.position = SCNVector3(x:0, y:100, z:-130)  // El eje Y es para subir un poquito y Z negativo es para que salga enfrente
        node.geometry = sphere
        
        
        // Colocamos el nodo en la escena
        // Un nodo puede tener varios hijos nodos
        sceneView.scene.rootNode.addChildNode(node)
        
        // Le agreamos sombras y luces
        sceneView.autoenablesDefaultLighting = true
        
        
        

//        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//
//        // Set the scene to the view
//        sceneView.scene = scene

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

            // Create a session configuration
            let configuration = ARWorldTrackingConfiguration()
            // Run the view's session
            sceneView.session.run(configuration)
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    
    
}

