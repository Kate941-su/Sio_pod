//
//  File.swift
//  
//
//  Created by KaitoKitaya on 2024/03/17.
//

import Foundation

class DownloadService:NSObject, URLSessionDownloadDelegate{
  
  var onReceiveProgress: ProgressCallback? = nil
    
  func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
    // TODO: Define complition
  }
  
  func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
    
    if let onReceiveProgress {
      onReceiveProgress(Int(totalBytesWritten), Int(totalBytesExpectedToWrite))
    }
    
//      let percentDownloaded = Double(totalBytesWritten) / Double(totalBytesExpectedToWrite) * 100
//      print("ダウンロード進行状況: \(percentDownloaded)%")
  }
}
