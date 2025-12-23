<script type="text/javascript">
const textarea = document.getElementById("tekstfelt");
textarea.addEventListener("input", function() {
let total_length = this.value.length;
let strLen = total_length.toLocaleString("da-DK");
document.getElementById("char-length").innerText = strLen;
});
</script>