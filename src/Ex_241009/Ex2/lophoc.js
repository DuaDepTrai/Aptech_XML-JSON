// Lấy thông tin lớp từ localStorage
let classData = JSON.parse(localStorage.getItem('classInfo')) || { DsSinhVien: { SinhVien: [], Lop: [] } };

// Hàm hiển thị danh sách sinh viên theo bảng, sắp xếp theo tên lớp
function displayStudents() {
    const studentList = document.getElementById("studentList");
    studentList.innerHTML = ""; // Clear previous content

    // Sắp xếp danh sách lớp theo tên lớp tăng dần
    const sortedClasses = classData.DsSinhVien.Lop.sort((a, b) => a.tenlop.localeCompare(b.tenlop));

    sortedClasses.forEach(lop => {
        const studentsInClass = classData.DsSinhVien.SinhVien.filter(sv => sv.malop === lop.malop);

        studentsInClass.forEach(sv => {
            const row = document.createElement("tr");

            row.innerHTML = `
                <td>${lop.malop}</td>
                <td>${lop.tenlop}</td>
                <td>${lop.hoten_gvcn}</td>
                <td>${sv.masv}</td>
                <td>${sv.hoten}</td>
                <td>${sv.ngaysinh}</td>
                <td>${sv.gioitinh}</td>
                <td>${sv.sodienthoai}</td>
                <td>${sv.created_at || "null"}</td>
                <td>${sv.updated_at || "null"}</td>
            `;
            studentList.appendChild(row);
        });
    });
}

// Hàm lưu thông tin sinh viên
function saveStudent() {
    const malop = document.getElementById("malop").value;
    const tenlop = document.getElementById("tenlop").value;
    const gvcn = document.getElementById("gvcn").value;
    const masv = document.getElementById("masv").value;
    const hoten = document.getElementById("hoten").value;
    const ngaysinh = document.getElementById("ngaysinh").value;
    const gioitinh = document.getElementById("gioitinh").value;
    const sodienthoai = document.getElementById("sodienthoai").value;
    const now = new Date().toISOString();

    // Kiểm tra xem lớp đã tồn tại chưa
    let lop = classData.DsSinhVien.Lop.find(l => l.malop === malop);

    if (!lop) {
        // Thêm mới lớp
        lop = {
            tenlop: tenlop,
            malop: malop,
            hoten_gvcn: gvcn
        };
        classData.DsSinhVien.Lop.push(lop);
        alert("Bạn đã thêm mới Lớp thành công!");
    }

    // Kiểm tra sinh viên đã tồn tại hay chưa
    let sinhvien = classData.DsSinhVien.SinhVien.find(sv => sv.masv === masv && sv.malop === malop);

    if (sinhvien) {
        // Cập nhật thông tin sinh viên
        sinhvien.hoten = hoten;
        sinhvien.ngaysinh = ngaysinh;
        sinhvien.gioitinh = gioitinh;
        sinhvien.sodienthoai = sodienthoai;
        sinhvien.updated_at = now; // Chỉ cập nhật updated_at
        alert("Bạn đã cập nhật lớp và sinh viên thành công!");
    } else {
        // Thêm mới sinh viên
        sinhvien = {
            hoten: hoten,
            masv: masv,
            malop: malop,
            ngaysinh: ngaysinh,
            gioitinh: gioitinh,
            sodienthoai: sodienthoai,
            created_at: now
        };
        classData.DsSinhVien.SinhVien.push(sinhvien);
        alert("Bạn đã thêm mới Sinh Viên thành công!");
    }

    // Lưu lại vào localStorage
    localStorage.setItem('classInfo', JSON.stringify(classData));
    displayStudents();
}

// Hàm xoá tất cả sinh viên
function deleteAllStudents() {
    localStorage.removeItem('classInfo');
    classData = { DsSinhVien: { SinhVien: [], Lop: [] } };
    displayStudents();
}

// Gọi hàm displayStudents khi tài liệu đã được tải
document.addEventListener("DOMContentLoaded", () => {
    displayStudents();
});