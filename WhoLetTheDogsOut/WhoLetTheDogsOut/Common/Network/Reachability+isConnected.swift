//
//  Reachability+isConnected.swift
//  WhoLetTheDogsOut
//
//  Created by Guilherme Antunes on 26/11/18.
//  Copyright © 2018 Guilherme Antunes. All rights reserved.
//

import Reachability

extension  Reachability {
    // MARK: - Private Computed Properties
    private  static  let defaultHost =  "www.google.com"
    private  static  var reachability =  Reachability ( hostname : defaultHost)
    
    // MARK: - Public Functions
    
    /// True value if there is a stable network connection
    var isConnected :  Bool {
        guard  let reachability = Reachability.reachability  else { return  false }
        
        return reachability.connection != .none
    }
}
