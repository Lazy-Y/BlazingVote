/**
 This file is part of the SFFocusViewLayout package.
 (c) Sergio Fernández <fdz.sergio@gmail.com>

 For the full copyright and license information, please view the LICENSE
 file that was distributed with this source code.
 */

import Foundation

struct Renderer: Presenter {

    func presentModel(model: Resource, inView view: CollectionViewCellRender) {
        view.setTitle(model.title)
        view.setDescription(model.description)
        if let image = model.image{
            view.setBackgroundImage(image)
        }
        else {
            let image = getRandomColorImage()
            view.setBackgroundImage(image)
        }
    }
}

func randFloat()->CGFloat{
    return CGFloat(Float(arc4random()) / Float(UINT32_MAX))/2 + 0.5
}

func getRandomColorImage()->UIImage{
    return getImageWithColor(UIColor(red: randFloat(), green: randFloat(), blue: randFloat(), alpha: 1), size: CGSize(width: 100, height: 100))
}

func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
    let rect = CGRectMake(0, 0, size.width, size.height)
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    color.setFill()
    UIRectFill(rect)
    let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
}