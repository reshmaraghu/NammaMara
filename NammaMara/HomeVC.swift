//
//  HomeVC.swift
//  NammaMara
//
//  Created by Raghu, Reshma L on 2/11/18.
//  Copyright © 2018 Raghu, Reshma L. All rights reserved.
//

import UIKit

class HomeVC: UIPageViewController, UIPageViewControllerDataSource {

	private(set) lazy var orderedViewControllers: [UIViewController] = {
		return [UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeContentVC"),
				UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeContentVC"),
				UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeContentVC")]
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		dataSource = self
		self.view.backgroundColor = UIColor(red: 79.0/255.0, green: 143.0/255.0, blue: 0.0/255.0, alpha: 1.0)
		setViewControllers([orderedViewControllers.first!], direction: .forward, animated: true, completion: nil)
	}

	func presentationCount(for pageViewController: UIPageViewController) -> Int {
		return orderedViewControllers.count
	}

	func presentationIndex(for pageViewController: UIPageViewController) -> Int {
		guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = orderedViewControllers.index(of: firstViewController) else {
				return 0
		}

		return firstViewControllerIndex
	}

	//MARK: Data Source
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
		guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
			return nil
		}

		let previousIndex = viewControllerIndex - 1

		guard previousIndex >= 0 else {
			return nil
		}

		guard orderedViewControllers.count > previousIndex else {
			return nil
		}

		return orderedViewControllers[previousIndex]
	}

	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
		guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
			return nil
		}

		let nextIndex = viewControllerIndex + 1
		let orderedViewControllersCount = orderedViewControllers.count

		guard orderedViewControllersCount != nextIndex else {
			return nil
		}

		guard orderedViewControllersCount > nextIndex else {
			return nil
		}

		return orderedViewControllers[nextIndex]
	}


}
