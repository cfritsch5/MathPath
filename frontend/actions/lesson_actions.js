import * as LessonUtil from '../util/lessons_util';

export const receiveLesson = lesson => {
  return {
    type: "RECEIVE_LESSON",
    lesson
  };
};

export const updateCurrentLesson = currentLesson => ({
  type: "UPDATE_CURRENT_LESSON",
  currentLesson
});

export const fetchLesson = (id) => dispatch => (
  LessonUtil.fetchLesson(id).then(lesson => dispatch(receiveLesson(lesson)))
);
