To-Do List App 📝
A simple and elegant Flutter-based To-Do List application that allows users to create, manage, and persist tasks. This app uses SharedPreferences to save data locally, ensuring that tasks are not lost when the app is closed.

Features ✨
Add Tasks: Users can input tasks through a text field and add them to their to-do list.
Delete Tasks: Tasks can be removed individually with a delete button.
Toggle Completion: Each task has a checkbox to mark it as complete or incomplete.
Data Persistence: All tasks and their completion states are saved locally using SharedPreferences, ensuring that data is preserved even after the app is restarted.
User-Friendly Interface: Clean UI design with interactive feedback for better user experience.

How It Works ⚙️
1. Adding Tasks
Enter a task in the input field and press the Add button.
The task is displayed in the list along with a checkbox and a delete icon.
The task is also saved locally using SharedPreferences.
2. Deleting Tasks
Tap the Delete icon next to a task to remove it from the list.
The corresponding entry is also removed from the local storage.
3. Marking Tasks as Completed
Tap the checkbox icon to toggle the task's completion state.
The updated state is saved in local storage.

4. Data Persistence
The app saves all tasks and their states locally.
When the app is reopened, the saved tasks and their states are reloaded from local storage.

Code Breakdown 🛠️
Widgets and Components
AppBar: Displays the app title.
TextFormField: Input field for entering new tasks.
ElevatedButton: Adds a new task to the list.
ListView.builder: Dynamically generates the list of tasks.
Card: Container for styling the task list.
ListTile: Displays each task with its name, a delete button, and a checkbox.
Data Handling
SharedPreferences is used for local storage:
toDolist: Stores the list of task strings.
checkBoxStates: Stores the completion state of tasks as a list of booleans.
