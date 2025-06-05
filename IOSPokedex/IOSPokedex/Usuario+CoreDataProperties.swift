//
//  Usuario+CoreDataProperties.swift
//  IOSPokedex
//
//  Created by user277135 on 6/15/25.
//
//

import Foundation
import CoreData


extension Usuario {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Usuario> {
        return NSFetchRequest<Usuario>(entityName: "Usuario")
    }

    @NSManaged public var id: String?
    @NSManaged public var nomeDeUsuario: String?
    @NSManaged public var email: String?
    @NSManaged public var senha: String?

}

extension Usuario : Identifiable {

}
