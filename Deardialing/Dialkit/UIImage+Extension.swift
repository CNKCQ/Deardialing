//
//  UIImage+Extension.swift
//  Deardialing
//
//  Created by KingCQ on 2016/12/10.
//  Copyright © 2016年 KingCQ. All rights reserved.
//

extension UIImage {
    
    /* 缩放 */
    public func resize(size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        draw(in: CGRect(origin: CGPoint.zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    /* 切图 */
    public func crop(rect: CGRect) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        draw(at: CGPoint(x: -rect.origin.x, y: -rect.origin.y))
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    /* 生成纯色图片, 默认大小1x1, 在UITableViewCell默认左侧图标使用时需要手动设定大小占位 */
    public class func image(with color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        UIGraphicsBeginImageContext(size)
        color.set()
        UIRectFill(CGRect(origin: CGPoint.zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    public func image(width radius: CGFloat, sizeToFit: CGSize) -> UIImage {
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: sizeToFit)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
        let path: CGPath = UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner.allCorners, cornerRadii: CGSize(width: radius, height: radius)).cgPath
        UIGraphicsGetCurrentContext()?.addPath(path)
        UIGraphicsGetCurrentContext()?.clip()
        self.draw(in: rect)
        UIGraphicsGetCurrentContext()?.drawPath(using: .fillStroke)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
