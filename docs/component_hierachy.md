## Component Hierarchy

**AuthFormContainer**
 - AuthForm

**LogIn**
 - username
 - password

 **loggedinContainer**

 **LoggedInHeader**
 - username Header
 - logout button


 **skilltreeContainer**
 - linked list modules

  **modulesContainer**


  **modules**
  * module name

  **ModuleContainer**

  **Module**
  - lessons

  **LessonContainer**

  **Lesson**
   - questions

  **QuestionsContainer**

  **Questions**
  - main questions content

  **AnswersContainer**

  **Answers**

  **AnswerChoice**
  - answer choice

## Routes

|Path   | Component   |
|-------|-------------|
| "/sign-up" | "AuthFormContainer" |
| "/sign-in" | "AuthFormContainer" |
| "/" | "SkillTreeContainer" |
| "/module/:moduleId" | "ModuleContainer" |
| "/module/:moduleId/lessonId" | "LessonContainer" |
