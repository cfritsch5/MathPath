// export const fetchLessons = () => (
//   $.ajax({
//     method: 'GET',
//     url: '/api/lessons'
//   })
// );

export const fetchLesson = id => (
  $.ajax({
    method: 'GET',
    url: `/api/lessons/${id}`,
  })
);

export const updateCurrentLesson = (userId,lessonId) => {
  let ajax = $.ajax({
    method: 'PATCH',
    url: `/api/users/${userId}`,
    data:{user:{lesson_id: lessonId}}
  });
  return ajax;
};
