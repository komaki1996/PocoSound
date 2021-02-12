//
//  CustomBtn.swift
//  SoundBtn
//
//  Created by 駒木剛瑠 on 2021/02/01.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    
    var selectView: UIView! = nil

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        myInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        myInit()
    }
    
    func myInit() {
        
        // 角を丸くする
        self.layer.cornerRadius = 5
        // 影をつける
        self.layer.shadowOffset = CGSize(width: 1, height: 1 )
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 1.0
        
        // ボタンを押している時にボタンの色を暗くするためのView
        selectView = UIView(frame: self.bounds)
        selectView.backgroundColor = UIColor.black
        selectView.alpha = 0.0
        self.addSubview(selectView)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        selectView.layer.cornerRadius = self.layer.cornerRadius
        selectView.frame = self.bounds

        
    }
    
    // タッチ開始
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
     
        UIView.animate(withDuration: 0.1, delay: 0.0, options: UIView.AnimationOptions.curveLinear, animations: {() -> Void in
            
            self.selectView.alpha = 0.5
            
        }, completion: {(finished: Bool) -> Void in
        })
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
         super.touchesCancelled(touches, with: event)

        UIView.animate(withDuration: 0.1, delay: 0.0, options: UIView.AnimationOptions.curveLinear, animations: {() -> Void in
            
            self.selectView.alpha = 0.0
            
        }, completion: {(finished: Bool) -> Void in
        })
        
    }
    
    // タッチ終了
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        UIView.animate(withDuration: 0.1, delay: 0.0, options: UIView.AnimationOptions.curveLinear, animations: {() -> Void in
            
            self.selectView.alpha = 0.0
            
        }, completion: {(finished: Bool) -> Void in
        })
    }
}
