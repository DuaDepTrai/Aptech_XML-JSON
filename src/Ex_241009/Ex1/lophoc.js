// Biến objJsonClass chứa thông tin lớp học và sinh viên
const objJsonClass = {
    "DsSinhVien": {
        "SinhVien": [
            {
                "hoten": "Nguyen Van A",
                "masv": "SV001",
                "ngaysinh": "2002-01-01",
                "gioitinh": "Nam",
                "sodienthoai": "0987654321",
                "malop": "A01"
            },
            {
                "hoten": "Tran Thi B",
                "masv": "SV002",
                "ngaysinh": "2003-02-01",
                "gioitinh": "Nu",
                "sodienthoai": "0987654322",
                "malop": "A02"
            },
            {
                "hoten": "Hoang Van C",
                "masv": "SV003",
                "ngaysinh": "2004-03-01",
                "gioitinh": "Nam",
                "sodienthoai": "0987654323",
                "malop": "A01"
            },
            {
                "hoten": "Pham Thi D",
                "masv": "SV004",
                "ngaysinh": "2005-04-01",
                "gioitinh": "Nu",
                "sodienthoai": "0987654324",
                "malop": "A02"
            },
            {
                "hoten": "Le Van E",
                "masv": "SV005",
                "ngaysinh": "2006-05-01",
                "gioitinh": "Nam",
                "sodienthoai": "0987654325",
                "malop": "A01"
            }
        ],
        "Lop": [
            {
                "tenlop": "Lop A01",
                "malop": "A01",
                "hoten_gvcn": "Dang Van G"
            },
            {
                "tenlop": "Lop A02",
                "malop": "A02",
                "hoten_gvcn": "Luu Van H"
            }
        ]
    }
};

// Hàm lưu thông tin lớp học vào localStorage
function saveToLocalStorage() {
    // Chuyển đổi objJsonClass thành chuỗi JSON
    const jsonData = JSON.stringify(objJsonClass);

    // Lưu vào localStorage với key 'classInfo'
    localStorage.setItem('classInfo', jsonData);

    // Hiển thị thông báo
    document.getElementById("message").textContent = "Thông tin lớp học đã được lưu vào localStorage.";
}