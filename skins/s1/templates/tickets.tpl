<div class="content_block">
    <h1>{$lang['tickets']}</h1>
    <br />

    <table class="table table-striped">
    <tr>
        <th>{$lang['id']}</th>
        <th>{$lang['subject']}</th>
        <th>{$lang['priority']}</th>
        <th>{$lang['department']}</th>
        <th>{$lang['last_reply']}</th>
        <th>{$lang['status']}</th>
    </tr>
    {if $tickets}
    {foreach $tickets as $t}
    {$ticket_rows = $ticket_rows+1}
    {if $ticket_rows & 1}{$ticket_class = 1}{else}{$ticket_class = 2}{/if}
    <tr>
        <td class="option{$ticket_class}-mini"><a href="{$td_url}/index.php?page=tickets&act=view&id={$t['mask']}">{$t['mask']}</a></td>
        <td class="option{$ticket_class}-mini"><a href="{$td_url}/index.php?page=tickets&act=view&id={$t['mask']}">{if $t['escalated']}<img src='{$img_url}/icon_escalate.png' alt='E' style='vertical-align:middle;margin-bottom:2px' />&nbsp;{/if}{$t['subject']}</a></td>
        <td class="option{$ticket_class}-mini"><img src="{$td_url}/images/priorities/{$t['icon_regular']}" alt="{$t['pname']}" class="prioritybox" />&nbsp;&nbsp;{$t['pname']}</td>
        <td class="row{$ticket_class}-mini">{$t['dname']}</td>
        <td class="row{$ticket_class}-mini">{$t['last_reply_human']}</td>
        <td class="option{$ticket_class}-mini">{$t['status_abbr']}</td>
    </tr>
    {/foreach}
    <tr>
        <td class="pagination" colspan="6">{$page_links}</td>
        

    </tr>
    {else}
    <tr>
        <td class="option1" colspan="6" align="center">{$lang['no_tickets']}</td>
    </tr>
    {/if}
    </table>
</div>