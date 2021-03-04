//
//  ViewController.swift
//  testUI
//
//  Created by Eddie on 02/03/2021.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private var vOverlap: UIView!
    @IBOutlet private var stvBanner: UIStackView!

    private var lcOverlapBottom: NSLayoutConstraint?

    @IBOutlet private var lbText: UILabel!
    @IBOutlet private var lbText2: UILabel!

    private var isExpanding = false { didSet {
        if isExpanding { expand() }
        else { collapse() }
        view.layoutIfNeeded()
    }}

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        // set constraint to banners
//        vOverlap.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: stvBanner.frame.height).isActive = true
//        vOverlap.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        lcOverlapBottom = vOverlap.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        updateOverlapConstraint()
    }

    @IBAction private func changeStackInfo() {
        lbText2.superview?.isHidden = !lbText2.superview!.isHidden

        if !isExpanding {
            view.layoutIfNeeded()
        } else { isExpanding = false }

        updateOverlapConstraint()
    }


    @IBAction private func expandCollapseText() {
        isExpanding = !isExpanding
    }

    private func expand() {
        lcOverlapBottom?.isActive = true
        lbText.numberOfLines = 0
        lbText2.numberOfLines = 0
    }

    private func collapse() {
        lcOverlapBottom?.isActive = false
        lbText.numberOfLines = 1
        lbText2.numberOfLines = 1
    }

    private func updateOverlapConstraint() {
        lcOverlapBottom?.constant = -stvBanner.frame.height
    }
}

