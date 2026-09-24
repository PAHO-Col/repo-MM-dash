<!-- plugins/buscar_usuario/views/buscar_usuario_view.php -->
<h2>Buscar Usuario</h2>
<form action="<?php echo url::site('buscar_usuario'); ?>" method="get">
    <input type="text" name="query" placeholder="Nombre del usuario">
    <button type="submit">Buscar</button>
</form>

<?php if (!empty($users)): ?>
    <h3>Resultados de la búsqueda:</h3>
    <ul>
        <?php foreach ($users as $user): ?>
            <li><?php echo $user->name; ?> - <?php echo $user->email; ?></li>
        <?php endforeach; ?>
    </ul>
<?php endif; ?>
