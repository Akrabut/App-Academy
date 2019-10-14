function Student(first, last) {
  this.first = first;
  this.last = last;
  this.courses = new Set();
}

Student.prototype.name = function () {
  return `${this.first} ${this.last}`;
};

Student.prototype.enroll = function (course) {
  this.courses.add(course);
  course.addStudent(this);
};

Student.prototype.courseLoad = function () {
  const hash = new Map();
  this.courses.forEach((course) => {
    if (hash.has(course.department)) {
      hash.set(course.department, hash.get(course.department) + course.credits);
    } else {
      hash.set(course.department, course.credits);
    }
  });
  return hash;
};


function Course(name, department, credits) {
  this.name = name;
  this.department = department;
  this.credits = credits;
  this.students = new Set();
}

Course.prototype.addStudent = function (student) {
  this.students.add(student);
  student.courses.add(this);
};

const s1 = new Student('ehad', 'shtaim');
const s2 = new Student('shtaim', 'shalosh');
const s3 = new Student('arba', 'hamesh');
const c1 = new Course('kurs1', 'A', 5);
const c2 = new Course('kurs2', 'B', 3);
const c3 = new Course('kurs3', 'C', 6);
const c4 = new Course('kurs4', 'B', 6);

console.log(s1.name());
s2.enroll(c1);
s2.enroll(c2);
s2.enroll(c3);
s2.enroll(c4);
console.log(s2.courseLoad());
c4.addStudent(s3);
console.log(c4.students);
