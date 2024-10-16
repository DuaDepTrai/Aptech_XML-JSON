let guestsData = JSON.parse(localStorage.getItem('guestsInfo')) || [];

function displayGuests() {
    const guestsList = document.getElementById("guestsList");
    guestsList.innerHTML = "";

    const guestsData = JSON.parse(localStorage.getItem('guests')) || [];

    guestsData.forEach((guest, index) => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${guest.guestId}</td>
            <td>${guest.guestName}</td>
            <td>${guest.email}</td>
            <td>${guest.phone}</td>
            <td>${guest.message}</td>
            <td>${guest.status}</td>
            <td>
                <button onclick="deleteGuest(${index})">Delete</button>
                <button onclick="updateGuest(${index})">Update</button>
            </td>
        `;
        guestsList.appendChild(row);
    });
}

 function saveGuests(event) {
    const guestId = document.getElementById("guestId").value;
    const guestName = document.getElementById("guestName").value;
    const email = document.getElementById("email").value;
    const phone = document.getElementById("phone").value;
    const message = document.getElementById("message").value;
    const status = document.getElementById("status").value;

    const guest = {
        guestId: guestId,
        guestName: guestName,
        email: email,
        phone: phone,
        message: message,
        status: status,
    }

    let guests = JSON.parse(localStorage.getItem("guests")) || [];

    guests.push(guest);

    localStorage.setItem("guests", JSON.stringify(guests));

    document.getElementById("guestForm").reset();

    alert("Guest added successfully!");
    displayGuests();
 }

 function deleteGuest(index) {
    let guests = JSON.parse(localStorage.getItem("guests")) || [];

    guests.splice(index, 1);

    localStorage.setItem('guests', JSON.stringify(guests));

    displayGuests();
 }

 let editIndex = null; // Biến lưu chỉ mục khách mời đang được chỉnh sửa

 function updateGuest(index) {
     const guestsData = JSON.parse(localStorage.getItem('guests')) || [];
     const guest = guestsData[index]; // Lấy khách mời theo index
 
     // Điền thông tin khách mời vào form để chỉnh sửa
     document.getElementById("guestName").value = guest.guestName;
     document.getElementById("email").value = guest.email;
     document.getElementById("phone").value = guest.phone;
     document.getElementById("message").value = guest.message;
     document.getElementById("status").value = guest.status;
 
     editIndex = index; // Ghi lại chỉ mục khách mời để cập nhật sau
 }
 
 function saveGuest() {
     const guestsData = JSON.parse(localStorage.getItem('guests')) || [];
 
     if (editIndex !== null) {
         // Cập nhật thông tin khách mời đang chỉnh sửa
         guestsData[editIndex] = {
             guestId: guestsData[editIndex].guestId, // Giữ nguyên ID
             guestName: document.getElementById("guestName").value,
             email: document.getElementById("email").value,
             phone: document.getElementById("phone").value,
             message: document.getElementById("message").value,
             status: document.getElementById("status").value
         };
 

         // Lưu lại vào LocalStorage
         localStorage.setItem('guest', JSON.stringify(guestsData));
 
         // Reset form và chỉ mục chỉnh sửa
         document.getElementById("guestForm").reset();
         editIndex = null;

 
         // Cập nhật lại danh sách hiển thị
         displayGuests();
     }
 }

 displayGuests();