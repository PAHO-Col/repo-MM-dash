<?php 
/**
 * lista view page.
 * mr_k ::: se crea la siguiente vista
 * PHP version 5
 *  
 * @author     sinergiainformatik Team <team@sinergiainformatik.com> 
 * @module     lista usuarios despues del filtro View
 * @copyright  sinergiainformatik - http://www.sinergiainformatik.com
 * @license    http://www.gnu.org/copyleft/lesser.html GNU Lesser General Public License (LGPL) 
 */
?>
		

		<div id="users_list">
    <?php if ($users->count() > 0): ?>
        <table class="table">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Email</th>
                    <th>Rol</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($users as $user): ?>
                    <tr>
                        <td><?php echo $user->username; ?></td>
                        <td><?php echo $user->email; ?></td>
                        <td><?php echo $user->role->name; ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    <?php else: ?>
        <p>No hay usuarios para este rol.</p>
    <?php endif; ?>
</div>

