param (
    [string] $user,
    [string] $source_drive,
    [string] $source_drive_id,
    [string] $target_drive,
    [string] $target_drive_id
)

$exclude_folders = 'node_modules __pycache__ AppData dat '
$exclude_files = 'NTUSER.DAT* ntuser.ini'
$robo_args = '/mt:64 /mir /tee *.gm2 *.vhdx *.gbp *.pst'
$logfile = [string]::Format('c:\users\{0}\{1}.log', $user, $source_drive_id)

'-------------------------------------------------------------------------------'  | add-content $logfile -encoding ascii
$backup_message = 'Backup device: ' + $target_drive_id
$backup_message | add-content $logfile -encoding ascii

$cmd = [Robo]::GetCmd( $user, $source_drive, $source_drive_id, $target_drive, $robo_args, $exclude_folders, $exclude_files, $logfile)
$backup_command = [scriptblock]::create($cmd)
$backup_command.invoke()

class Robo {
    [string] static GetCmd(
            [string]$user,
            [string]$source_drive,
            [string]$source_drive_id,
            [string]$target_drive,
            [string]$robo_args,
            [string]$exclude_folders,
            [string]$exclude_files,
            [string]$logfile)
        {

        $sb = [System.Text.StringBuilder]::new()
        [void]$sb.Append('robocopy {source_drive}\users\{user}\documents {target_drive}\backup\{source_drive_id}\documents ')
        [void]$sb.Append('/xd {exclude_folders} ')
        [void]$sb.Append('/xf {exclude_files} ')
        [void]$sb.Append('{robo_args} ')
        [void]$sb.Append('/log+:' + $logfile)

        $sb.replace('{user}', $user.trim())
        $sb.replace('{source_drive}', $source_drive.trim())
        $sb.replace('{target_drive}', $target_drive.trim())
        $sb.replace('{source_drive_id}', $source_drive_id.trim())
        $sb.replace('{robo_args}', $robo_args)
        $sb.replace('{exclude_folders}', [string]::join(' ', $exclude_folders))
        $sb.replace('{exclude_files}', [string]::join(' ', $exclude_files))

        return $sb.ToString()
    }
}

