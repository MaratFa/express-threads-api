const express = require("express");
const router = express.Router();
const multer = require("multer");
const UserController = require("../controllers/user-controller");

const uploadDestination = "uploads";

// Показываем, где хранить файлы
const storage = multer.diskStorage({
  destination: uploadDestination,
  filename: function (req, file, cb) {
    cb(null, file.originalname);
  },
});

const uploads = multer({ storage: storage });

router.post("/register", UserController.register);
router.post("/login", UserController.login);
router.get("/current", UserController.current);
router.get("/user/:id", UserController.getUserById);
router.put("/user/:id", UserController.updateUser);

module.exports = router;
