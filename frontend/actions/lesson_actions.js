import * as LessonUtil from '../util/lessons_util';
// import { receiveErrors, clearErrors } from './error_actions';

export const receiveLessons = lessons => ({
  type: "RECEIVE_LESSONS",
  lessons
});

export const receiveLesson = lesson => ({
  type: "RECEIVE_LESSON",
  lesson
});

export const fetchLessons = () => dispatch => (
  LessonUtil.fetchLessons().then(lessons => dispatch(receiveLessons(lessons)))
);

export const fetchLesson = (id) => dispatch => (
  LessonUtil.fetchLesson(id).then(lesson => dispatch(receiveLesson(lesson)))
);
