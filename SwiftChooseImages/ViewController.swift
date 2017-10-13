//
//  ViewController.swift
//  SwiftChooseImages
//
//  Created by 云中科技 on 2017/10/13.
//  Copyright © 2017年 云中科技. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    let imageView = UIImageView();
    let pickerImageController = UIImagePickerController();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imageView.center = self.view.center;
        imageView.bounds = CGRect(x:0,y:0,width:300,height:300);
        imageView.backgroundColor = UIColor.red;
        imageView.isUserInteractionEnabled = true;
        self.view.addSubview(imageView);
        
        //设置代理
        self.pickerImageController.delegate = self
        
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.alertActionController();
    }
    //选择图片成功后代理
    func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String : Any]) {
        
        //查看info对象
        print(info)
        
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        //图片控制器退出
        picker.dismiss(animated: true, completion:nil)
    }
    func chooseImagefromCamera(){
        
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
            //设置来源
            self.pickerImageController.sourceType = UIImagePickerControllerSourceType.camera
            //打开相机
            self.present(self.pickerImageController, animated:true, completion:nil)
        }
        else
        {
            debugPrint("找不到相机")
        }
    }
    func chooseImagefromAlbum () {
        //判断设置是否支持图片库
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        {
            //指定图片控制器类型
            self.pickerImageController.sourceType = UIImagePickerControllerSourceType.photoLibrary
            //弹出控制器，显示界面
            self.present(self.pickerImageController, animated: true, completion:nil);
        }
        else
        {
            print("读取相册错误")
        }
    };
    
    func alertActionController(){
        
        let selectorController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        selectorController.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil)) // 取消按钮
        selectorController.addAction(UIAlertAction(title: "拍照选择", style: .default) { action in
            self.chooseImagefromCamera();
        }) // 拍照选择
        selectorController.addAction(UIAlertAction(title: "相册选择", style: .default) { action in
            self.chooseImagefromAlbum();
        }) // 相册选择
        present(selectorController, animated: true, completion: nil)
    }
}

