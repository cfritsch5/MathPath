import * as LessonUtil from '../util/lessons_util';

export const receiveLesson = lesson => {
  return {
    type: "RECEIVE_LESSON",
    lesson
  };
};

export const updateCurrentLesson = data => ({
  type: "UPDATE_CURRENT_LESSON",
  data
});

export const fetchLesson = (id) => dispatch => (
  LessonUtil.fetchLesson(id).then(lesson => dispatch(receiveLesson(lesson)))
);

export const updateLesson = (userId, lessonId) => dispatch => (
  LessonUtil.updateCurrentLesson(userId, lessonId).then(
    data => dispatch(updateCurrentLesson(data))
  )
);
