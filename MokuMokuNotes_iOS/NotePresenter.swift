//
//  NotePresenter.swift
//  MokuMokuNotes_iOS
//
//  Created by Yoshitaka Seki on 2018/04/28.
//  Copyright © 2018年 takasek. All rights reserved.
//

import Foundation

protocol NotePresenterDelegate: class {
    func notePresenterDidReceiveNotes(_ notes: [Note])
}

final class NotePresenter {
    private let repository: NoteRepository
    weak var delegate: NotePresenterDelegate!

    init(repository: NoteRepository) {
        self.repository = repository
        // FIXME: set self to repository's `delegate: NoteRepositoryDelegate` here
    }

    func getNotes() {
        repository.getNotes()
    }

    func addNewNote() {
        let note = Note(createdAt: Date())
        repository.save(note: note)
    }
}

// FIXME: extend NotePresenter as NoteRepositoryDelegate
// hint: see also: Swiftのextensionは3パターンだけ〜そして条件付き適合へ･･･〜 - Qiita
//       https://qiita.com/crea/items/4297bf60d222d661498f
// hint: some build error can be solved automatically by IDE. Try clicking a red circle.
//extension NotePresenter: NoteRepositoryDelegate {
//    // FIXME: tell `self.delegate: NotePresenterDelegate` that the presenter receives notes
//}

