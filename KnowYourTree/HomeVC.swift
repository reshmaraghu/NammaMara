//
//  HomeVC.swift
//  KnowYourTree
//
//  Created by Raghu, Reshma L on 2/11/18.
//  Copyright © 2018 Raghu, Reshma L. All rights reserved.
//

import UIKit

class HomeVC: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

	// The custom UIPageControl
	@IBOutlet weak var pageControl: UIPageControl!

	// The UIPageViewController
	var pageContainer: UIPageViewController!

	private(set) lazy var orderedViewControllers: [UIViewController] = {
		return [UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeContentVC"),
				UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeContentVC"),
				UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeContentVC")]
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor(red: 79.0/255.0, green: 143.0/255.0, blue: 0.0/255.0, alpha: 1.0)

		// Create the page container
		pageContainer = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
		pageContainer.delegate = self
		pageContainer.dataSource = self
		pageContainer.setViewControllers([orderedViewControllers.first!], direction: .forward, animated: true, completion: nil)

		// Add it to the view
		view.addSubview(pageContainer.view)

		// Configure our custom pageControl
		view.bringSubview(toFront: pageControl)
		pageControl.numberOfPages = orderedViewControllers.count
		pageControl.currentPage = 0
	}

	//MARK: Data Source
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
		let currentIndex = orderedViewControllers.index(of: viewController)!
		if currentIndex == 0 {
			return nil
		}
		let previousIndex = abs((currentIndex - 1) % orderedViewControllers.count)
		return orderedViewControllers[previousIndex]
	}

	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
		let currentIndex = orderedViewControllers.index(of: viewController)!
		if currentIndex == orderedViewControllers.count-1 {
			return nil
		}
		let nextIndex = abs((currentIndex + 1) % orderedViewControllers.count)
		return orderedViewControllers[nextIndex]
	}

}
