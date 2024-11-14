//
//  AudioStatus.swift
//  Ribbit
//
//  Created by Jessie Chen on 11/6/24.
//

import Foundation
import AVFoundation

enum AudioStatus: Int, CustomStringConvertible {
  
  case stopped,
       playing,
       recording,
       recordingStopped
  
  var audioName: String {
    let audioNames = [ "Audio:Stopped", "Audio:Playing", "Audio:Recording", "Audio:RecordingStopped"]
    return audioNames[rawValue]
  }
  
  var description: String {
    return audioName
  }
}
