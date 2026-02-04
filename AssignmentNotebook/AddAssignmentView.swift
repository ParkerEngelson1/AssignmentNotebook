//
//  AddAssignmentView.swift
//  AssignmentNotebook
//
//  Created by Parker Engelson on 2/2/26.
//

import SwiftUI

struct AddAssignmentView: View {
    @Environment(AssignmentList.self) var assignments: AssignmentList
    @Environment(\.dismiss) var dismiss
    static let courses = ["Math ➕", "English  📚", "History 📰", "Science 🧪", "Mobile Apps 💻"]
    @State private var course = ""
    @State private var description = ""
    @State private var dueDate = Date()
    var body: some View {
        NavigationView {
            Form {
                Picker("Course", selection: $course) {
                    ForEach(Self.courses, id: \.self) { priority in
                        Text(priority)
                    }
                }
                TextField("Description", text: $description)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                    .navigationBarTitle("Add Assignment", displayMode: .inline)
                    .navigationBarItems(trailing: Button("Save") {
                        if course.count > 0, description.count > 0 {
                            let item = AssignmentItem(course: course, description: description, dueDate: dueDate)
                            assignments.items.append(item)
                            dismiss()
                        }
                    })
            }
        }
    }
}

