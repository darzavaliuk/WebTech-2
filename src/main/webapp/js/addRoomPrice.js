var addRoom = document.getElementById('addRoomPrice');

// When the user clicks anywhere outside of the addRoom, close it
window.onclick = function(event) {
    if (event.target === addRoom) {
        addRoom.style.display = "none";
    }
};