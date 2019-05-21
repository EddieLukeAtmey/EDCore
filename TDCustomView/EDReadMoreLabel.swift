//
//  EDCollapseLabel.swift
//  EDCore
//
//  Created by Eddie Luke Atmey on 07/28/17.
//  Copied and edited and trimmed from ExpandableLabel
//
//  Copyright © 2017 Eddie. All rights reserved.
//

typealias LineIndexTuple = (line: CTLine, index: Int)

import UIKit

class EDReadMoreLabel: UILabel {

    @IBInspectable var collapsedAttributedLink: NSAttributedString!
    @IBInspectable var ellipsis: NSAttributedString!

    var linkRect: CGRect?

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    fileprivate func commonInit() {
        isUserInteractionEnabled = true
        lineBreakMode = .byClipping
        numberOfLines = 3
        collapsedAttributedLink = NSAttributedString(string: "read more",
                                                     attributes: [NSAttributedString.Key.font: font!,
                                                                  NSAttributedString.Key.foregroundColor: UIColor(rgbHex: 0x37A3B1)!])
        ellipsis = NSAttributedString(string: "...")
    }

    open override var text: String? {
        set(text) {
            if let text = text {
                self.attributedText = NSAttributedString(string: text)
            }
            else {
                self.attributedText = nil
            }
        }
        get {
            return self.attributedText?.string
        }
    }

    //    open override var attributedText: NSAttributedString? {
    //        set(attributedText) {
    //            if let attributedText = attributedText?.copyWithAddedFontAttribute(font), attributedText.length > 0 {
    //                super.attributedText = getCollapsedText(for: attributedText, link: collapsedAttributedLink!)
    //            }
    //            else {
    //                super.attributedText = nil
    //            }
    //        }
    //        get {
    //            return super.attributedText
    //        }
    //    }

    fileprivate func findLineWithWords(lastLine: CTLine, text: NSAttributedString, lines: [CTLine]) -> LineIndexTuple {
        var lastLineRef = lastLine
        var lastLineIndex = self.numberOfLines - 1
        var lineWords = spiltIntoWords(str: text.text(for: lastLineRef).string as NSString)
        while lineWords.count < 2 && lastLineIndex > 0 {
            lastLineIndex -=  1
            lastLineRef = lines[lastLineIndex] as CTLine
            lineWords = spiltIntoWords(str: text.text(for: lastLineRef).string as NSString)
        }
        return (lastLineRef, lastLineIndex)
    }

    fileprivate func getCollapsedText(for text: NSAttributedString?, link: NSAttributedString) -> NSAttributedString? {
        guard let text = text else { return nil }
        let lines = text.lines(for: frame.size.width)
        let collapsedNumberOfLines = self.numberOfLines

        if collapsedNumberOfLines > 0 && collapsedNumberOfLines < lines.count {
            let lastLineRef = lines[collapsedNumberOfLines-1] as CTLine
            let lineIndex = findLineWithWords(lastLine: lastLineRef, text: text, lines: lines)
            let modifiedLastLineText = textWithLinkReplacement(lineIndex, text: text, linkName: link)
            let collapsedLines = NSMutableAttributedString()
            let differenceFromStart = (collapsedNumberOfLines-1) - lineIndex.index
            let emptyLineIndent = (2 + differenceFromStart)
            if collapsedNumberOfLines - emptyLineIndent > 0 {
                for index in 0...collapsedNumberOfLines-emptyLineIndent {
                    collapsedLines.append(text.text(for: lines[index]))
                }
            } else {
                collapsedLines.append(text.text(for: lines[0]))
            }
            collapsedLines.append(modifiedLastLineText)
            return collapsedLines
        }
        return text
    }

    fileprivate func spiltIntoWords(str: NSString) -> [String] {
        var strings: [String] = []
        str.enumerateSubstrings(in: NSRange(location: 0, length: str.length), options: [.byWords, .reverse]) { (word, subRange, enclosingRange, stop) -> Void in
            if let unwrappedWord = word {
                strings.append(unwrappedWord)
            }
            if strings.count > 1 { stop.pointee = true }
        }
        return strings
    }

    fileprivate func textWithLinkReplacement(_ lineIndex: LineIndexTuple, text: NSAttributedString, linkName: NSAttributedString) -> NSAttributedString {
        let lineText = text.text(for: lineIndex.line)
        var lineTextWithLink = lineText
        (lineText.string as NSString).enumerateSubstrings(in: NSRange(location: 0, length: lineText.length), options: [.byWords, .reverse]) { (word, subRange, enclosingRange, stop) -> Void in
            let lineTextWithLastWordRemoved = lineText.attributedSubstring(from: NSRange(location: 0, length: subRange.location))
            let lineTextWithAddedLink = NSMutableAttributedString(attributedString: lineTextWithLastWordRemoved)
            if let ellipsis = self.ellipsis {
                lineTextWithAddedLink.append(ellipsis)
                lineTextWithAddedLink.append(NSAttributedString(string: " ", attributes: [NSAttributedString.Key.font: self.font!]))
            }
            lineTextWithAddedLink.append(linkName)
            let fits = self.textFitsWidth(lineTextWithAddedLink)
            if fits {
                lineTextWithLink = lineTextWithAddedLink
                let lineTextWithLastWordRemovedRect = lineTextWithLastWordRemoved.boundingRect(for: self.frame.size.width)
                let wordRect = linkName.boundingRect(for: self.frame.size.width)
                let width = lineTextWithLastWordRemoved.string == "" ? self.frame.width : wordRect.size.width
                self.linkRect = CGRect(x: lineTextWithLastWordRemovedRect.size.width, y: self.font.lineHeight * CGFloat(lineIndex.index), width: width, height: wordRect.size.height)
                stop.pointee = true
            }
        }
        return lineTextWithLink
    }

    override func drawText(in rect: CGRect) {

        if let attributedText = self.attributedText?.copyWithAddedFontAttribute(self.font), (self.attributedText?.length ?? 0) > 0 {
            super.attributedText = getCollapsedText(for: attributedText, link: collapsedAttributedLink!)
        }
        else {
            super.attributedText = nil
        }

        super.drawText(in: rect)
    }

    fileprivate func textFitsWidth(_ text: NSAttributedString) -> Bool {
        return (text.boundingRect(for: frame.size.width).size.height <= font.lineHeight) as Bool
    }
}

private extension NSAttributedString {
    func hasFontAttribute() -> Bool {
        guard !self.string.isEmpty else { return false }
        let font = self.attribute(NSAttributedString.Key.font, at: 0, effectiveRange: nil) as? UIFont
        return font != nil
    }

    func copyWithAddedFontAttribute(_ font: UIFont) -> NSAttributedString {
        if !hasFontAttribute() {
            let copy = NSMutableAttributedString(attributedString: self)
            copy.addAttribute(NSAttributedString.Key.font, value: font, range: NSRange(location: 0, length: copy.length))
            return copy
        }
        return self.copy() as! NSAttributedString
    }

    func copyWithHighlightedColor() -> NSAttributedString {
        let alphaComponent = CGFloat(0.5)
        let baseColor: UIColor = (self.attribute(NSAttributedString.Key.foregroundColor, at: 0, effectiveRange: nil) as? UIColor)?.withAlphaComponent(alphaComponent) ?? UIColor.black.withAlphaComponent(alphaComponent)
        let highlightedCopy = NSMutableAttributedString(attributedString: self)
        let range = NSRange(location: 0, length: highlightedCopy.length)
        highlightedCopy.removeAttribute(NSAttributedString.Key.foregroundColor, range: range)
        highlightedCopy.addAttribute(NSAttributedString.Key.foregroundColor, value: baseColor, range: range)
        return highlightedCopy
    }

    func lines(for width: CGFloat) -> [CTLine] {
        let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: width, height: .greatestFiniteMagnitude))
        let frameSetterRef: CTFramesetter = CTFramesetterCreateWithAttributedString(self as CFAttributedString)
        let frameRef: CTFrame = CTFramesetterCreateFrame(frameSetterRef, CFRange(location: 0, length: 0), path.cgPath, nil)

        let linesNS: NSArray  = CTFrameGetLines(frameRef)
        let linesAO: [AnyObject] = linesNS as [AnyObject]
        let lines: [CTLine] = linesAO as! [CTLine]

        return lines
    }

    func text(for lineRef: CTLine) -> NSAttributedString {
        let lineRangeRef: CFRange = CTLineGetStringRange(lineRef)
        let range: NSRange = NSRange(location: lineRangeRef.location, length: lineRangeRef.length)
        return self.attributedSubstring(from: range)
    }

    func boundingRect(for width: CGFloat) -> CGRect {
        return self.boundingRect(with: CGSize(width: width, height: .greatestFiniteMagnitude),
                                 options: .usesLineFragmentOrigin, context: nil)
    }
}

