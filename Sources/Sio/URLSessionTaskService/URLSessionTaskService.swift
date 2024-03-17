//
//  File.swift
//
//
//  Created by KaitoKitaya on 2024/03/17.
//

import Foundation

class URLSessionTaskService: NSObject, URLSessionTaskDelegate {
  
  var onReceiveProgress: ProgressCallback? = nil
  var onSendProgress: ProgressCallback? = nil
  var session: URLSession
  
  init(session: URLSession) {
    self.session = session
  }
  
  deinit {
    print("Download Service Deinit")
  }
  
  func urlSession(_ session: URLSession, task: URLSessionTask, didSendBodyData bytesSent: Int64, totalBytesSent: Int64, totalBytesExpectedToSend: Int64) {
    print("ON SEND DATA")
    if let onSendProgress {
        onSendProgress(Int(totalBytesSent), Int(totalBytesExpectedToSend))
    }
  }

  func urlSession(
    _ session: URLSession, downloadTask: URLSessionDownloadTask,
    didFinishDownloadingTo location: URL
  ) {
    print("Download finished")
  }

  func urlSession(
    _ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64,
    totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64
  ) {
    print("ON RECEIVE DATA")
    if let onReceiveProgress {
      onReceiveProgress(Int(totalBytesWritten), Int(totalBytesExpectedToWrite))
    }
  }
}
